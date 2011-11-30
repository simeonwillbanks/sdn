# Load the rails application
require File.expand_path('../application', __FILE__)

# Load env vars from local file for settings which shouldn't be in vcs
env_vars = File.join(Rails.root, 'config', 'env_vars.rb')
load(env_vars) if File.exists?(env_vars)

# Initialize the rails application
Sdn::Application.initialize!
