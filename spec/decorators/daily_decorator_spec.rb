# encoding: utf-8
require 'spec_helper'

describe DailyDecorator do
  before { ApplicationController.new.set_current_view_context }
  let(:daily) { Factory.build(:daily, :created_at => DateTime.new(2001, 2, 3), :origin_poid => 42).decorate }

  it "sets a pretty created at date" do
    daily.created_at.should eq("February 3, 2001")
  end

  it "has a Momentile permalink" do
    daily.src.should eq("http://momentile.com/tiles/42/large.jpg")
  end

  it "and json representation includes the permalink" do
    JSON.parse(daily.to_json)['src'].should eq("http://momentile.com/tiles/42/large.jpg")
  end
end
