class LinkGrabber
  def self.for_url(url)
    hash_form(MetaInspector.new(url, :allow_redirections => :safe))
  end

  def self.hash_form(meta_object)
    return {
      :title => meta_object.title,
      :description => meta_object.description
    }
  end
end
