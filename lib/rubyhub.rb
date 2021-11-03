require 'bundler'
Bundler.require

# Add caching option to octokit
Octokit.middleware = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, serializer: Marshal, shared_cache: false
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end

module RubyHub
  require 'rubyhub/repository'
  require 'rubyhub/clients/github_client'
  require 'rubyhub/git_repositories'
end
