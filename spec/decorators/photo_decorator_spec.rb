# encoding: utf-8
require 'spec_helper'

describe PhotoDecorator do
  before { ApplicationController.new.set_current_view_context }
  let(:photo) { Factory.build(:photo, :origin_poid => 6409067007).decorate }

  it "has a Flickr permalink" do
    photo.src.should eq('http://farm8.staticflickr.com/7002/6409067007_27626e6284.jpg')
  end

  it "and json representation includes the permalink" do
    JSON.parse(photo.to_json)['src'].should eq('http://farm8.staticflickr.com/7002/6409067007_27626e6284.jpg')
  end
end
