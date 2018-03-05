RSpec.describe Videos::Video do
  before :all do
    @uri = Videos::URI.new('http://youtu.be/dQw4w9WgXcQ')
    @video = Videos::Video.new(@uri)
  end

  describe 'instance methods' do
    subject { @video }
    it { is_expected.to respond_to(:embed_code) }
    it { is_expected.to respond_to(:to_html) }
  end

  describe '#embed_code' do
    subject { @video.embed_code }
    it { is_expected.to include('<video') }
    it { is_expected.to include('src=') }
    it { is_expected.to include('<span') }
    it { is_expected.to include('sorry') }
  end
end
