require 'spec_helper'

describe PhotoDecorator do
  before { ApplicationController.new.set_current_view_context }
  let(:photo) { Factory.build(:photo, :origin_poid => 42).decorate }

  it "has a Flickr permalink" do
    photo.src.should eq("http://flickr.com/photos/42/large.jpg")
  end

  it "and json representation includes the permalink" do
    JSON.parse(photo.to_json)['src'].should eq("http://flickr.com/photos/42/large.jpg")
  end
end
