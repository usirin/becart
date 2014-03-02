class LinkEngine
  def self.get_meta(url)
    return nil unless valid_url?(url)
    meta = MetaInspector.new(url, :allow_redirections => :safe)
    link_meta = LinkMeta.for_meta(meta)
  end

  def self.valid_url?(url)
    url = MetaInspector::URL.new(url).url
    url =~ valid_url_regexp ? true : false
  end

  def self.valid_url_regexp
    /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
  end
end
