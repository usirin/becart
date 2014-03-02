require_relative "../../app/services/link_meta"

describe LinkMeta do
  it "has a title" do
    meta = double(:title => "google", :description => "google rocks")
    LinkMeta.for_meta(meta).title.should == "google"
  end

  it "has a description" do
    meta = double(:title => "google", :description => "google rocks")
    LinkMeta.for_meta(meta).description.should == "google rocks"
  end
end
