require 'uri'
require 'cgi'
require 'httparty'

class Videos::URI
  PROVIDERS_BY_HOST = {
    'www.youtube.com' => 'youtube',
    'youtu.be'        => 'youtube',
    'vimeo.com'       => 'vimeo'
  }

  def initialize(uri)
    @uri = uri
  end

  def obj
    URI.parse(@uri)
  end

  def provider
    PROVIDERS_BY_HOST.has_key?(obj.host) ? PROVIDERS_BY_HOST[obj.host] : 'video'
  end

  def query
    CGI::parse(obj.query).to_h
  end

  def content_type
    @content_type ||= get_content_type
  end

  def to_s
    obj.to_s
  end

  private

  def get_content_type
    resp = HTTParty.head(@uri, follow_redirects: true)
    resp.headers['content-type'].split(';')[0]
  end
end
