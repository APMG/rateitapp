# frozen_string_literal: true

source 'https://rubygems.org'

# Declare your gem's dependencies in rateitapp.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

gem 'rails', ENV['RATEITAPP_RAILS4'] ? '~> 4.2' : '~> 5.1'

group :development do
  # Mark up the models and such with database info.
  gem 'annotate'

  # Security static analysis
  gem 'brakeman'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'webmock'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec'
  gem 'rspec-rails'

  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop'
end
