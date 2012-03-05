require 'bundler/capistrano'

# Load env vars from local file for settings which shouldn't be in vcs
load File.expand_path(File.dirname(__FILE__) + '/env_vars.rb')

set :bundle_flags, "--deployment"
set :application, "sdn"
set :repository,  "git@github.com:simeonwillbanks/sdn"

set :scm, "git"
set :user, "simeon"

# Agent forwarding can make key management much simpler as 
# it uses your local keys instead of keys installed on the server.
ssh_options[:forward_agent] = true

set :rails_env, "production"

set :deploy_to, "/home/simeon/app"
set :user, "simeon"
set :group, "staff"

set :branch, "master"
# Only fetch the changes since the last
set :deploy_via, :remote_cache

set :use_sudo, false

server "64.34.219.4", :app, :web, :db, :primary => true

after "deploy:restart", "deploy:cleanup"

set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :unicorn do
  desc "start unicorn"
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && #{try_sudo} bundle exec unicorn -c #{current_path}/config/unicorn/#{rails_env}.rb -E #{rails_env} -D"
  end
  desc "stop unicorn"
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  desc "graceful stop unicorn"
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  desc "reload unicorn"
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end

  after "deploy:restart", "unicorn:reload"
end

namespace :remote_rake do  
  desc "Run a task on a remote server."  
  # run like: cap staging rake:invoke task=a_certain_task  
  task :invoke do  
    run("cd #{deploy_to}/current && bundle exec rake #{ENV['task']} RAILS_ENV=#{rails_env}")  
  end  
end

namespace :deploy do
  namespace :db do
    desc "Creates the database.yml configuration file in shared path"
    task :setup, :except => { :no_release => true } do

      location = fetch(:template_dir, "config") + '/database.yml.erb'
      template = File.read(location)

      config = ERB.new(template)

      run "mkdir -p #{shared_path}/db" 
      run "mkdir -p #{shared_path}/config" 
      put config.result(binding), "#{shared_path}/config/database.yml"
    end

    desc <<-DESC
      [internal] Updates the symlink for database.yml file to the just deployed release.
    DESC
    task :symlink, :except => { :no_release => true } do
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
    end

    desc <<-DESC
      [internal] Creates production database
    DESC
    task :create, :except => { :no_release => true } do
      run "cd #{release_path} && bundle exec rake db:create RAILS_ENV=production" unless fetch(:skip_db_create, true)
    end
  end

  after "deploy:setup",           "deploy:db:setup"   unless fetch(:skip_db_setup, false)
  after "deploy:finalize_update", "deploy:db:symlink", "deploy:db:create"
end
