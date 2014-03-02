require_relative "../../app/services/link_cache"
require_relative "../../app/services/link_grabber"

class CachedLink
  class NoLink < RuntimeError; end
end

describe LinkCache do
  let(:url) { "http://google.com" }
  let(:link_meta) { double(:title => "Google", :description => "google is cool") }

  it "returns cached link if they exist" do
    CachedLink.stub(:for_url).with(url) { link_meta }
    LinkCache.for_url("http://google.com").should == link_meta
  end

  context "when the link is not cached" do
    before do
      CachedLink.stub(:for_url).with(url).and_raise(CachedLink::NoLink)
      LinkGrabber.stub(:for_url).with(url) { link_meta }
      CachedLink.stub(:save_link)
    end

    it "recompiles link" do
      LinkCache.for_url(url).should == link_meta
    end

    it "stores new link" do
      CachedLink.should_receive(:save_link).with(link_meta)
      LinkCache.for_url(url)
    end
  end
end
