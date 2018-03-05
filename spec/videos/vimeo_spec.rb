RSpec.describe Videos::Vimeo do
  before :all do
    @vimeo_id = '76979871'
    @vimeo_url = 'https://player.vimeo.com/video/' + @vimeo_id
    @uri = Videos::URI.new(@vimeo_url)
    @video = Videos::Vimeo.new(@uri)
  end

  describe 'instance methods' do
    subject { @video }
    it { is_expected.to respond_to(:src) }
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:width) }
    it { is_expected.to respond_to(:height) }
    it { is_expected.to respond_to(:options) }
    it { is_expected.to respond_to(:allowfullscreen) }
  end

  describe '#id' do
    subject { @video.id }
    it { is_expected.to eq(@vimeo_id) }
  end

  describe '#src' do
    subject { @video.src }
    it { is_expected.to eq(@vimeo_url) }
  end

  describe '#embed_code' do
    subject { @video.embed_code }
    it { is_expected.to start_with('<iframe') }
    it { is_expected.to include('src=') }
    it { is_expected.to include('https://') }
    it { is_expected.to include('width=') }
    it { is_expected.to include('height=') }

    context 'allowfullscreen default true' do
      it { is_expected.to include('allowfullscreen') }
    end

    context 'allowfullscreen false' do
      subject { described_class.new(@uri, allowfullscreen: false).embed_code }
      it { is_expected.not_to include('allowfullscreen') }
    end
  end
end
