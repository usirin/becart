class CachedLink < ActiveRecord::Base
  class NoLink < RuntimeError; end

  attr_reader :url, :title, :description

  def self.for_url(url)
    db_link = find_by(:url => url) or raise NoLink
    db_link.to_meta_link
  end


  def to_meta_link
    LinkMeta.new
  end
end
