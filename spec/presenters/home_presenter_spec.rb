# encoding: utf-8
require 'spec_helper'

describe HomePresenter do
  subject { HomePresenter.new(1) }
  describe "#each" do
    it "iterates a specific number of moments" do
      subject.stub(:collection) { [].tap{ |arr| 3.times { arr << FactoryGirl.build(:moment) } } }
      PostDecorator.should_receive(:decorate).exactly(3).times
      subject.each{}.length.should eq(3)
    end
  end
end
