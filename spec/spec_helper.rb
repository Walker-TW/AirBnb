require_relative './setup_test_database'
#add simple cov setup to rspec setup file=>>
require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start
#set up environment
ENV['RACK_ENV'] = 'test'
# ENV['ENVIRONMENT'] = 'test'
#add capybara setup
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require './app'
Capybara.app = MakersBnB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true
  # Use the specified formatter
  config.formatter = :documentation
  config.after(:suite) do
    puts
  end
end