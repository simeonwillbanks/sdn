require 'spec_helper'

describe HomePresenter do
  subject { HomePresenter.new((1..3).inject([]) {|arr, n| arr << Factory.build(:moment) }) }
  describe "#each" do
    it "iterates a specific number of moments" do
      PostDecorator.should_receive(:decorate).exactly(3).times
      subject.each{}.length.should eq(3)
    end
  end
end
