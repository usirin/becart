require_relative "../../app/services/link_engine"
require_relative "../../app/services/link_meta"
require "metainspector"
require "vcr_helper"

describe LinkEngine do
  it "gets a link instance" do
    VCR.use_cassette("medium-grab") do
      meta = MetaInspector.new("medium.com", :allow_redirections => :safe)
      link_meta = LinkEngine.get_meta("medium.com")
      expect(link_meta).to be_a LinkMeta
    end
  end

  it "returns nil if it is not valid url" do
    LinkEngine.get_meta("not_valid_url").should == nil
  end

  context "#valid_url?" do
    it "returns true if it is valid url" do
      LinkEngine.valid_url?("google.com").should == true
    end

    it "returns false if it is not valid url" do
      LinkEngine.valid_url?("not_valid_url").should == false
    end
  end
end
