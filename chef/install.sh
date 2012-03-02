#!/bin/bash

chef_binary=~/.rbenv/shims/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
export DEBIAN_FRONTEND=noninteractive
# Upgrade headlessly (this is only safe-ish on vanilla systems)
aptitude update 
apt-get -o Dpkg::Options::="--force-confnew" \
    --force-yes -fuy dist-upgrade 
# Install Ruby and Chef
apt-get -y install git-core curl 
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash 
cat << EOF > ~/.bash_profile
export PATH="$HOME/.rbenv/bin:$PATH"
eval "\$(rbenv init -)"
EOF
source ~/.bash_profile 
# Production installing gems skipping ri and rdoc
cat << EOF > ~/.gemrc
install: --no-rdoc --no-ri
update: --no-ri --no-rdoc
EOF
# Best practice Bundler + rbenv configuration:
# Among others see...
# http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
mkdir -p ~/.bundle
cat << EOF > ~/.bundle/config
BUNDLE_SHEBANG: ruby-local-exec
BUNDLE_WITHOUT: test:development
EOF
rbenv bootstrap-ubuntu-10-04 
rbenv update 
rbenv install 1.9.2-p290 
rbenv global 1.9.2-p290 
gem install chef 
# bundler 1.1 for shebang functionality
gem install bundler --pre
rbenv rehash
chown -hR simeon:staff ~/
fi

# Env vars required by app
cp ~/chef/.bash_environment_variables ~/.ssh/environment
echo "PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" >> ~/.ssh/environment
chmod 600 ~/.ssh/environment && chown simeon:simeon ~/.ssh/environment && source ~/.ssh/environment

# Substitute any attributes which are set by env vars
sed -i "s/pchangeme/$SDN_PSQL_POSTGRES_PASSWORD/" solo.json
sed -i "s/schangeme/$SDN_PSQL_SIMEON_PASSWORD/" solo.json

# Chef go!
"$chef_binary" -c solo.rb -j solo.json
