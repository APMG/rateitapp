***NOTICE***: **This project is archived**

This project is archival only. It is no longer maintained or supported.

---

# Welcome to the RateIt App

[![Build Status](https://travis-ci.org/APMG/rateitapp.svg?branch=master)](https://travis-ci.org/APMG/rateitapp)

This project rocks and you should probably use it for rating things like songs, books and episodes of MacGyver.

## Install

Place this line in your Gemfile:

    gem 'rateitapp'

Then bundle:

    $ bundle install

### Generate Initializer and Model

You'll need to create both a RateIt plugin initializer and a playlist plugin model. To do this, enter the following command into your terminal:

    $ rails g rateitapp:install

Creating a model for your playlist (`app/models/playlist_plugin.rb`) will validate that the items that are being rated are actually ratable objects in your database. Be sure to configure your plugin in order to set your ratable type. Add the name of your plugin to `config/initializers/rateit_app.rb` by editing the following line:

    Rateitapp.plugin_manager.add(PlaylistPlugin.new('the-name_of_your_plugin'))

The model requires an environment variable be set in your `config/application.rb` file. This directs the model where to check when validating items being rated:

    config.playlist_domain = 'your_playlist.domain.com'

### Copy Migrations

Copy the migrations from the RateIt engine and create your database:

    $ rake rateitapp:install:migrations

### Configuring Routes

You'll need to mount the RateIt App as an engine in your routes. Place the code below in `config/routes.rb`:

    mount Rateitapp::Engine => '/'

### OAuth

Note that RateIt depends on OAuth for user authentication. You can set the location of your auth server in your `config/application.rb` file:

    config.oauth_domain = 'accounts.your_auth_server.com'

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
