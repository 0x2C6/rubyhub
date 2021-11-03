describe RubyHub::Repository do
  context 'with valid entity' do
    subject { described_class.new(name: 'rails', owner: 'rails', url: 'github.com/rails/rails') }

    # Useless but checking some interface changes
    its(:name)  { is_expected.to eq('rails') }
    its(:owner) { is_expected.to eq('rails') }
    its(:url)   { is_expected.to eq('github.com/rails/rails') }

    it 'should serialize correctly' do
      expect(subject.to_h).to include(
        name: 'rails',
        owner: 'rails',
        url: 'github.com/rails/rails'
      )
    end
  end

  context 'for invalid entity' do
    it 'should raise error if name missing' do
      expect {described_class.new(owner: 'rails', url: 'github.com/rails/rails')}
        .to raise_error(/:name is missing/)
    end

    it 'should raise error if owner missing' do
      expect {described_class.new(name: 'rails', url: 'github.com/rails/rails')}
        .to raise_error(/:owner is missing/)
    end

    it 'should raise error if url missing' do
      expect {described_class.new(name: 'rails', owner: 'rails')}
        .to raise_error(/:url is missing/)
    end
  end
end
