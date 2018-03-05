require 'action_view'

class Videos::Video
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Context

  attr_reader :uri

  def initialize(uri)
    @uri = uri
  end

  def embed_code
    content_tag(:video) do
      concat(tag(:source, src: @uri.to_s, type: @uri.content_type))
      concat(content_tag(:span, sorry_message))
    end
  end
  alias_method :to_html, :embed_code

  def sorry_message
    "I'm sorry; your browser doesn't support HTML5 video."
  end
end
