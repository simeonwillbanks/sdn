# encoding: utf-8
require 'spork'

ENV["RAILS_ENV"] = 'test'

# @see https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu
Spork.prefork do

  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'pry'

  # Delay route loading to speed up Devise
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)
  
  require 'shoulda/matchers/integrations/rspec'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
    config.extend ControllerMacros, :type => :controller
  end

end

Spork.each_run do
  require 'factory_girl_rails' 
  FactoryGirl.reload
end

