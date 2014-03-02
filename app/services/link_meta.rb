class LinkMeta
  attr_reader :title, :description
  def self.for_meta(meta)
    new(meta)
  end

  def initialize(meta)
    @title = meta.title
    @description = meta.description
  end
end
