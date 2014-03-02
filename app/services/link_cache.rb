class LinkCache
  def self.for_url(url)
    begin
      CachedLink.for_url(url)
    rescue CachedLink::NoLink
      link = LinkGrabber.for_url(url)
      CachedLink.save_link(link)
      link
    end
  end
end
