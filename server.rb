require 'rubyhub'
require 'sinatra/base'

module Server
  class API < Sinatra::Base
    error do
      content_type :json
      status 500
    
      e = env['sinatra.error']
      {:result => 'error', :message => e.message}.to_json
    end

    get '/' do
      erb :home
    end

    get '/search' do
      # Just putting simple logic to here
      # Beacuse its less code for now

      # client = RubyHub::GitlabClient.new
      client = RubyHub::GithubClient.new

      # might apply other serializetion straties
      # libs, patterns
      RubyHub::GitRepositories.new(client).find(params.fetch(:query)).map(&:to_h).to_json

    # Handle all erros for now  
    rescue => e
      status(500)
      body({ error: e.message }.to_json)
    end

  end
end
