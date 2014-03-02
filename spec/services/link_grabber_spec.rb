require_relative "../../app/services/link_grabber"

class LinkEngine; end

describe LinkGrabber do
  it "grabs link from engine" do
    link_meta = double(:title => "Google", :description => "google is cool")
    LinkEngine.stub(:get_meta).with("http://google.com") { link_meta }
    LinkGrabber.for_url("http://google.com").should == link_meta
  end

  it "raises an error if url is not valid" do
    LinkGrabber.stub(:valid_url?).with("not_valid_url") { false }
    LinkEngine.stub(:get_meta).with("not_valid_url") { nil }
    expect do
      LinkGrabber.for_url("not_valid_url")
    end.to raise_error LinkGrabber::NotValidUrl
  end
end
