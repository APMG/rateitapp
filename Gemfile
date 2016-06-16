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

group :development do
  # Mark up the models and such with database info.
  gem 'annotate'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
end

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'

  gem 'rubocop'
  gem 'pry'
  gem 'pry-byebug'
end
