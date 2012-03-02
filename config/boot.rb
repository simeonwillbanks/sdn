# encoding: utf-8
require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# Load env vars from local file for settings which shouldn't be in vcs
load File.expand_path(File.dirname(__FILE__) + '/env_vars.rb')

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
