require 'simplecov'
SimpleCov.start do
  root(File.join(File.dirname(__FILE__), '..'))
  coverage_dir 'reports/coverage'
  add_filter '/spec/'
  add_filter '/features/'
  add_filter '/admin/'
  add_filter '/db/'
  add_filter '/config/'
  add_group 'Models', 'models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Repositories', 'app/repositories'
  add_group 'Mailers', 'app/mailers'
  add_group 'Security', 'app/security'
  add_group 'Forms', 'app/forms'
  add_group 'Lib', 'lib'
end

RACK_ENV = 'test'.freeze unless defined?(RACK_ENV)

require File.expand_path(File.dirname(__FILE__) + '/../config/boot')
Dir[File.expand_path(File.dirname(__FILE__) + '/../app/helpers/**/*.rb')].each(&method(:require))

require 'spec_helpers/validation_helpers'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include Capybara
  conf.include ValidationHelpers
end

def app
  JobVacancy::App.tap { |app| }
  JobVacancy::App.set :protect_from_csrf, false
end
