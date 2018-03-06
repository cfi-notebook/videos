RSpec.describe Videos::URI do
  before :all do
    @youtube_id = 'dQw4w9WgXcQ'
    @youtube_uri = "https://www.youtube.com/watch?v=#{@youtube_id}"
    @youtube_short = 'https://youtu.be/BkEUpymTanA'
    @uri = Videos::URI.new(@youtube_uri)
  end

  describe 'instance methods' do
    subject { @uri }
    it { is_expected.to respond_to(:obj) }
    it { is_expected.to respond_to(:provider) }
    it { is_expected.to respond_to(:query) }
    it { is_expected.to respond_to(:content_type) }
    it { is_expected.to respond_to(:to_s) }
  end

  describe '.provider' do
    context 'long youtube url' do
      it 'identifies the provider as youtube' do
        expect(@uri.provider).to eq('youtube')
      end
    end

    context 'short youtube url' do
      let(:uri) { described_class.new(@youtube_short) }

      it 'identifies the provider as youtube' do
        expect(uri.provider).to eq('youtube')
      end
    end

    context 'youtube url with no www' do
      subject { described_class.new('https://youtube.com/embed/ihee35QrWtk').provider }
      it { is_expected.to eq('youtube') }
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
    
    context 'short youtube uri' do
      let(:uri) { described_class.new(@youtube_short) }
      it 'returns false if there is no query' do
        expect(uri.query).to be_falsy
      end
    end
  end

  describe '.content_type' do
    context 'with invalid url or no Internet' do
      subject { described_class.new('lkjsdljksdlkjdsf').content_type }
      it { is_expected.to be_nil }
    end

    context 'mp4' do
      let(:uri) { described_class.new('https://www.faa.gov/v_ondemand/StressinAviation_FAA_Web.mp4') }
      it 'gets the content-type' do
        expect(uri.content_type).to eq('video/mp4')
      end
    end
  end
end
