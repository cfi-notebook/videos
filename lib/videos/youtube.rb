class Videos::YouTube < Videos::Video
  def embed_code
    content_tag(:iframe, '', type: 'text/html', width: width, height: height, src: src)
  end

  def id
    id = ''
    url = @uri.to_s.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if url[2] != nil
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0];
    else
      id = url;
    end
    id
  end

  def src
    "https://www.youtube.com/embed/#{id}"
  end
end
