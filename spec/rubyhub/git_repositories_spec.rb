describe RubyHub::GitRepositories do
  context 'github' do
    let(:client) { RubyHub::GithubClient.new }
    let(:repo)   { described_class.new(client) }

    describe '#find' do
      it 'should return with success' do
        VCR.use_cassette('search') do
          result = repo.find('rails')
          
          expect(result.first).to be_kind_of RubyHub::Repository
          expect(result.size).to eq(30)
        end
      end
    end
  end
end
