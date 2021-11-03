# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gemspec
gem 'puma'
gem 'octokit'
gem 'sinatra'
gem 'dry-types'
gem 'json'
gem 'dry-struct'
gem 'faraday-http-cache'
gem 'pry-nav'

group :test do
  gem 'rack-test'
  gem 'webmock'
  gem 'vcr'
  gem 'rspec'
  gem 'rspec-its'
end
