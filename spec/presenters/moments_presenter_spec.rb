require 'spec_helper'

describe MomentsPresenter do

  # TODO why must I specify the subject like this?
  # Without this line, subject.method throws a NoMethodError
  subject { MomentsPresenter }

  describe ".decorate_resource?" do
    it "false when a post is shown" do
      subject.decorate_resource?(:post, 'show').should eq(false)
    end

    it "true when multiple posts are displayed" do
      subject.decorate_resource?(:post, 'index').should eq(true)
    end

    it "true when a daily is shown" do
      subject.decorate_resource?(:daily, 'show').should eq(true)
    end
  end
end
