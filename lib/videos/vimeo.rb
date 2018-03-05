class Videos::Vimeo < Videos::Video
  VIMEO_DEFAULTS = {
    allowfullscreen: true
  }

  def initialize(uri,options={})
    options = VIMEO_DEFAULTS.merge(options)
    super(uri,options)
  end

  def embed_code
    content_tag(:iframe, '', src: src, width: width, height: height, allowfullscreen: allowfullscreen)
  end
  alias_method :to_html, :embed_code

  def allowfullscreen
    @options[:allowfullscreen]
  end

  def src
    "https://player.vimeo.com/video/#{id}"
  end

  def id
    @uri.to_s.match(/https?:\/\/(?:[\w]+\.)*vimeo\.com(?:[\/\w]*\/?)?\/(?<id>[0-9]+)[^\s]*/)[:id]
  end
end
