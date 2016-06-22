# Welcome to the RateIt App

[![Build Status](https://travis-ci.org/APMG/rateitapp.svg?branch=master)](https://travis-ci.org/APMG/rateitapp)

This project rocks and you should probably use it for rating things like songs, books and episodes of MacGyver.

## Install

Place this line in your Gemfile:

    gem 'rateitapp'

Then bundle:

    $ bundle install

## Usage

You may use any of the following URL patterns once you've setup your plugin. The plugin
name will give you your `ratable_type`, which in the examples below are song and book.

**Show rating for an item whose ID is 1:**

    GET /api/v1/ratables/song/1
    GET /api/v1/ratables/book/1

**Show ratings for several items:**

    GET /api/v1/ratables/song/3,14,47
    GET /api/v1/ratables/book/7,11

**List all ratings by a user whose ID is 1:**

    GET /api/v1/users/1/ratings

**Create or update a user's rating:**

    POST /api/v1/users/1/ratings

**List all ratings of a specific type by a user whose ID is 1:**

    GET /api/v1/users/1/ratings/song
    GET /api/v1/users/1/ratings/book

**Show rating whose ID is 2 of a specific type by a user whose ID is 1:**

    GET /api/v1/users/1/ratings/song/2
    GET /api/v1/users/1/ratings/book/2

**Show ratings of a specific type by a user whose ID is 1:**

    GET /api/v1/users/1/ratings/song/3,14,47
    GET /api/v1/users/1/ratings/book/7,11

## Plugin Setup

Once you've installed the RateIt gem, you'll need to configure your plugin in order to set your ratable type. Add the name of your plugin to `config/initializers/rateit_app.rb` by editing the following line:

    Rateitapp.plugins.add('name_of_your_plugin')

## Testing

RateIt App uses Rspec for model and request tests, and uses Cucumber for feature testing. If you would like to take advantage of the test suite or contribute by extending coverage, ensure that the following gems are installed:

    gem 'rspec'
    gem 'rspec-rails'
    gem 'cucumber-rails', require: false
    gem 'factory_girl_rails'
    gem 'database_cleaner'

To run all the tests in the suite:

    rake tests

To run just the feature tests:

    bundle exec cucumber

To run only the Rspec tests:

    bundle exec rspec

## Contact

Questions or problems? File an issue here on [GitHub](https://github.com/APMG/rateitapp/issues).

## Contributors

RateIt is primarily the work of [William Johnston (will-in-wi)](https://github.com/will-in-wi) and [Nathan Vanderlaan (nvanderlaan)](https://github.com/nvanderlaan). See the [Contributors](https://github.com/APMG/rateitapp/graphs/contributors) graph for a full list of contributors.

## Copyright

Copyright (c) 2016 American Public Media. See MIT-LICENSE for further details.
