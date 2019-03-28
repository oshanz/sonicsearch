# Sonic Search

[![Gem Version](https://badge.fury.io/rb/sonicsearch.svg)](https://badge.fury.io/rb/sonicsearch) [![Build Status](https://travis-ci.org/oshanz/sonicsearch.svg?branch=master)](https://travis-ci.org/oshanz/sonicsearch) [![Code Climate](https://codeclimate.com/github/oshanz/sonicsearch/badges/gpa.svg)](https://codeclimate.com/github/oshanz/sonicsearch)

Rails friendly driver for the [sonic search](https://github.com/valeriansaliou/sonic) backend.
![Alt text](https://gist.githubusercontent.com/oshanz/7b3278dacbcaa82fac9084d9386523c3/raw/c500e27e5e18f0cc20dd5a76fad424ef3d453ce3/colortext.svg?sanitize=true)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sonicsearch'
```

And then execute:

    $ bundle

## Usage

- sonarsearch will always try to maintain the API compatibility with [searchkick](https://github.com/ankane/searchkick), so you can switch between search engines with less effort as your requirements.
