require 'spec_helper'

describe VideoDecorator do
  before { ApplicationController.new.set_current_view_context }
  let(:youtube) { Factory.build(:video, :origin_poid => 'OaQsiEedR4o').decorate } 
  let(:flickr) { Factory.build(:video, :origin => 'flickr', origin_poid: "2675040228").decorate }
  
  it "has a Youtube permalink" do
    youtube.url.should eq('http://www.youtube.com/watch?v=OaQsiEedR4o')
  end

  it "and json representation includes the permalink" do
    JSON.parse(youtube.to_json)['url'].should eq('http://www.youtube.com/watch?v=OaQsiEedR4o')
  end

  it "has player html" do
    youtube.player.should eq("<iframe width=\"459\" height=\"344\" src=\"http://www.youtube.com/embed/OaQsiEedR4o?fs=1&feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>")
  end

  it "can also be from Flickr" do
    flickr.url.should eq('http://www.flickr.com/photos/simeonsdotnet/2675040228')
  end
end
