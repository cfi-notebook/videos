RSpec.describe Videos::Video do
  before :all do
    @uri = Videos::URI.new('http://youtu.be/dQw4w9WgXcQ')
    @video = Videos::Video.new(@uri)
  end

  describe 'instance methods' do
    subject { @video }
    it { is_expected.to respond_to(:embed_code) }
    it { is_expected.to respond_to(:to_html) }
    it { is_expected.to respond_to(:options) }
    it { is_expected.to respond_to(:width) }
    it { is_expected.to respond_to(:height) }
    it { is_expected.to respond_to(:controls) }
    it { is_expected.to respond_to(:provider) }
  end

  describe '#embed_code' do
    subject { @video.embed_code }
    it { is_expected.to include('<video') }
    it { is_expected.to include('controls') }
    it { is_expected.to include('src=') }
    it { is_expected.to include('<span') }
    it { is_expected.to include('sorry') }
  end

  describe '#provider' do
    context 'youtube' do
      subject { Videos.factory('http://youtu.be/alsdkfj').provider }
      it { is_expected.to eq('youtube') }
    end

    context 'vimeo' do
      subject { Videos.factory('https://vimeo.com/123').provider }
      it { is_expected.to eq('vimeo') }
    end

    context 'video' do
      subject { Videos.factory('https://some.url.com/video.mp4').provider }
      it { is_expected.to eq('video') }
    end
  end
end
