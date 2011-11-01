require 'spec_helper'

describe Post do
  context "validations" do
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:body) }
    it { should have_many(:moments) }
  end

  let(:created_at) { 2.days.ago }
  let(:post) { Factory(:post, :created_at => created_at) }
  
  context "assignment" do
    it "allows created_at to be assigned" do
      post.created_at.to_s.should == created_at.to_s
    end
  end

  context "associations" do
    it "has a Moment" do
      post.moments.length.should == 1
    end
    it "and the Moment is a Post" do
      post.moments.first.subject_type.should == 'Post'
    end
    it "on subsequent save, the Post still has a single Moment" do
      post.update_attributes(:headline => "version 2")
      post.moments.length.should == 1
    end
  end
end
