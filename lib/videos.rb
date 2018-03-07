require "videos/version"
require "videos/tag_helpers"
require "videos/uri"
require "videos/video"
require "videos/youtube"
require "videos/youtube"
require "videos/vimeo"

module Videos
  PROVIDERS = {
    'youtube' => Videos::YouTube,
    'vimeo'   => Videos::Vimeo,
    'video'   => Videos::Video
  }

  def self.factory(uri_string,options={})
    uri = Videos::URI.new(uri_string)
    PROVIDERS[uri.provider].new(uri,options)
  end
end
