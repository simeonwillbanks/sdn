#!/bin/bash

chef_binary=~/.rbenv/shims/chef-solo

# Env vars required by app which is sourced by bash profile
mv ~/chef/.bash_environment_variables ~/

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
    touch ~/.bash_profile 
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    source $HOME/.bash_environment_variables' >> ~/.bash_profile 
    source ~/.bash_profile 
    rbenv bootstrap-ubuntu-10-04 
    rbenv update 
    rbenv install 1.9.2-p290 
    rbenv global 1.9.2-p290 
    gem install --no-rdoc --no-ri chef 
    rbenv rehash
    chown simeon:staff ~/.bash_profile
    chown -hR simeon:staff ~/.rbenv
else
  # Source bash_profile so subsequent runs have rbenv in path and any new env vars
  source ~/.bash_profile
fi

# Substitute any attributes which are set by env vars
sed -i "s/changeme/$SDN_POSTGRESQL_PASSWORD/" solo.json

# Chef go!
"$chef_binary" -c solo.rb -j solo.json
