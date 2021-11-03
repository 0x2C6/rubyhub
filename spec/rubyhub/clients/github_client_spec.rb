describe RubyHub::GithubClient do
  let(:client) { described_class.new }

  describe '#search' do
    it 'should return with success' do
      VCR.use_cassette("search") do
        res = client.search('rails')
        
        expect(res).to be_kind_of(Array)
        expect(res.size).to eq(30)
      end
    end

    it 'should raise error' do
      expect { client.search('') }.to raise_error(RubyHub::GithubClient::NoSearchTermError)
    end
  end
end
