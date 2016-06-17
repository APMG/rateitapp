# Welcome to the RateIt App

<img src="https://travis-ci.org/APMG/rateitapp.svg?branch=master" alt="Build Status" /> https://travis-ci.org/APMG/rateitapp

This project rocks and uses MIT-LICENSE.

### Usage

You may use any of the following URL patterns once you've setup your plugin. The plugin
name will give you your `ratable_type`, which in the examples below are song and book.

**Show rating for an item whose ID is 1:**

    GET /api/v1/ratables/song/1
    GET /api/v1/ratables/book/1

**Show ratings for several items:**

    GET /api/v1/ratables/song/3,14,47
    GET /api/v1/ratables/book/7,11

**Show info about a user whose ID is 1:**

    GET /api/v1/users/1

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
