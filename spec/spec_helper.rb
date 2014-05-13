ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb", __FILE__)
require 'minitest/autorun'
require 'rspec/rails'
require 'capybara/rails'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.after do
    I18n.locale = :en
    Babel::TEMP_TRANSLATIONS = []
    FileUtils.cp('spec/fixtures/en.yml', 'spec/dummy/config/locales/')
    FileUtils.cp('spec/fixtures/fr.yml', 'spec/dummy/config/locales/')
    I18n.reload!
  end
end

Capybara.javascript_driver = :webkit
