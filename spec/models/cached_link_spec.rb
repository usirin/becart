require "spec_helper"
require_relative "../../app/services/link_meta"

describe CachedLink do
  context "When there is a cached link in database" do
    it "returns LinkMeta object" do
      # cached_link = double(:url => "google.com", :description => "google rocks")
      # CachedLink.stub(:find_by).with({:url => "google.com"}) { cached_link }
      # expect do
      #   CachedLink.for_url("google.com")
      # end.to be_a LinkMeta
    end
  end

  context "When there is not a cached link in database" do
    it "throws an exception to say that" do
      CachedLink.stub(:find_by) { nil }
      expect do
        CachedLink.for_url("google.com")
      end.to
    end
  end
end
