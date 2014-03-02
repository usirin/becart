class LinkGrabber
  class NotValidUrl < RuntimeError; end

  def self.for_url(url)
    link = LinkEngine.get_meta(url)
    raise NotValidUrl if link.nil?
    link
  end
end
