require_relative "../../app/services/link_grabber"
require 'metainspector'
require 'vcr_helper'

describe LinkGrabber do
  let(:document) { MetaInspector.new("medium.com", :allow_redirections => :safe) }
  let(:grabbed_hash) { LinkGrabber.for_url("medium.com") }

  before do
    VCR.use_cassette("medium-grab") do
      document && grabbed_hash
    end
  end

  context ".url", :vcr => true do
    it "grabs the title of a website" do
      grabbed_hash[:title].should == document.title
    end

    it "grabs the description of a website" do
      grabbed_hash[:description].should == document.description
    end
  end
end
