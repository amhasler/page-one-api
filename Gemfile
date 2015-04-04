source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'
gem "activeadmin", github: "gregbell/active_admin" # Until it's 1.0.0
gem "devise"
gem "active_model_serializers"
gem 'grape'
gem "grape-active_model_serializers"
gem "grape-swagger-rails"
gem "rack-cors", require: "rack/cors"
# Enable tagging
gem 'acts-as-taggable-on',      '~> 3.4'

gem 'carrierwave',             '0.10.0'
gem 'rmagick', require: false
gem 'unf'
gem 'fog',                     '1.23.0'
gem 'mime-types'

# Synchronize assets with S3
gem 'asset_sync',              group: :assets

group :development do
  gem "better_errors"
  gem "meta_request"
  gem "quiet_assets"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "faker"
  gem "poltergeist"
  gem "pry-nav"
  gem "pry-rails"
  gem "pry-stack_explorer"
  gem "pry-theme"
  gem "rspec-rails"
  gem 'rspec-its'
  gem "rubocop"
  gem "shoulda-matchers"
  gem "spring-commands-rspec"
  gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork'
    # Mock external services
  gem 'webmock'  
  gem 'simplecov', :require => false
end

