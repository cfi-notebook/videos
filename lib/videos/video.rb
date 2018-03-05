require 'action_view'

class Videos::Video
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Context
  attr_reader :uri
  attr_accessor :options

  DEFAULTS = {
    width: 640,
    height: 360,
    controls: true
  }
  def initialize(uri,options={})
    @uri = uri
    @options = DEFAULTS.merge(options)
  end

  def embed_code
    content_tag(:video, '', controls: controls) do
      concat(tag(:source, src: @uri.to_s, type: @uri.content_type))
      concat(content_tag(:span, sorry_message, class: 'sorry'))
    end
  end
  alias_method :to_html, :embed_code

  def sorry_message
    "I'm sorry; your browser doesn't support HTML5 video."
  end

  def width
    @options[:width]
  end

  def height
    @options[:height]
  end

  def controls
    @options[:controls]
  end
end
