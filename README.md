# Sonic Search

[![Gem version](https://badge.fury.io/gh/oshanz%2Fsonicsearch.svg)](https://badge.fury.io/gh/oshanz%2Fsonicsearch.svg) [![Build Status](https://travis-ci.org/oshanz/sonicsearch.svg?branch=master)](https://travis-ci.org/oshanz/sonicsearch) [![Code Climate](https://codeclimate.com/github/oshanz/sonicsearch/badges/gpa.svg)](https://codeclimate.com/github/oshanz/sonicsearch)  
Rails friendly driver for the sonic search backend.  
This is a very early stage of the package, bugfixes and api changes are welcome

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sonicsearch'
```

And then execute:

    $ bundle

## Usage

- sonarsearch will always try to maintain the API compatibility with [searchkick](https://github.com/ankane/searchkick), so you can switch between search engines with less effort as your requirements.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
