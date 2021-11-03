require 'pry-nav'
describe Server::API do
  include Rack::Test::Methods
  let(:app) { described_class.new }
  
  context 'GET /search' do
    it 'should return with success' do
      VCR.use_cassette('search') do
        get '/search?query=rails'
        expect(last_response.status).to eq(200)
        
        body = JSON.parse(last_response.body, symbolize_names: true)
        expect(body.size).to eq(30)
        expect(body.first).to include(
          name: 'rails',
          owner: 'rails',
          url: 'https://github.com/rails/rails'
        )
      end 
    end

    it 'should return 500' do
      VCR.use_cassette('search') do
        get '/search?query='
        expect(last_response.status).to eq(500)
        body = JSON.parse(last_response.body, symbolize_names: true)
        expect(body).to include(:error)
      end 
    end
  end
end
