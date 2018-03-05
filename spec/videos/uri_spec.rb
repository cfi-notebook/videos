RSpec.describe Videos::URI do
  before :all do
    @youtube_id = 'dQw4w9WgXcQ'
    @uri = Videos::URI.new("https://www.youtube.com/watch?v=#{@youtube_id}")
  end

  describe 'methods' do
    subject { @uri }
    it { is_expected.to respond_to(:obj) }
    it { is_expected.to respond_to(:provider) }
    it { is_expected.to respond_to(:query) }
    it { is_expected.to respond_to(:content_type) }
  end

  describe '.provider' do
    context 'long youtube url' do
      it 'identifies the provider as youtube' do
        expect(@uri.provider).to eq('youtube')
      end
    end

    context 'short youtube url' do
      let(:uri) { described_class.new('https://youtu.be/BkEUpymTanA') }

      it 'identifies the provider as youtube' do
        expect(uri.provider).to eq('youtube')
      end
    end

    context 'vimeo url' do
      let(:uri) { described_class.new('https://vimeo.com/136531109') }

      it 'identifies the provider as vimeo' do
        expect(uri.provider).to eq('vimeo')
      end
    end 
  end

  describe '.query' do
    it 'returns the query as a hash' do
      expect(@uri.query).to be_a(Hash)
    end

    it 'parses the query properly' do
      expect(@uri.query.keys.first).to eq('v')
      expect(@uri.query['v']).to be_a(Array)
      expect(@uri.query['v'][0]).to eq(@youtube_id)
    end
  end

  describe '.content_type' do
    context 'mp4' do
      let(:uri) { described_class.new('https://www.faa.gov/v_ondemand/StressinAviation_FAA_Web.mp4') }
      it 'gets the content-type' do
        expect(uri.content_type).to eq('video/mp4')
      end
    end
  end
end
