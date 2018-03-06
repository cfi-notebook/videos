RSpec.describe Videos::YouTube do
  before :all do
    @youtube_id = 'dQw4w9WgXcQ'
    @youtube_url = "https://www.youtube.com/watch?v=#{@youtube_id}"
    @youtube_url_short = "http://youtu.be/#{@youtube_id}"
    @youtube_url_no_www = "https://youtube.com/embed/#{@youtube_id}"
    @youtube_uri = Videos::URI.new(@youtube_url_short)
    @video = Videos::YouTube.new(@youtube_uri)
  end

  describe 'instance methods' do
    subject { @video }
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:src) }
  end

  describe '#id' do
    context 'long youtube url' do
      subject { Videos::YouTube.new(@youtube_url).id }
      it { is_expected.to eq(@youtube_id) }
    end

    context 'short youtube url' do
      subject { Videos::YouTube.new(@youtube_url_short).id }
      it { is_expected.to eq(@youtube_id) }
    end

    context 'youtube url no www' do
      subject { Videos::YouTube.new(@youtube_url_no_www).id }
      it { is_expected.to eq(@youtube_id) }
    end
  end

  describe '#embed_code' do
    subject { @video.embed_code }
    it { is_expected.to start_with('<iframe') }
    it { is_expected.to include('type="text/html"') }
    it { is_expected.to include('width=') }
    it { is_expected.to include('height=') }
    it { is_expected.to include('src=') }
    it { is_expected.to include('https://') }
  end
end
