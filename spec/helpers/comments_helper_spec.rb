require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CommentsHelper do
  let(:moment_symbol) { :post }
  let(:moment) { Factory(moment_symbol, :comments => [Factory(:comment)]) }
  before(:each) do
    helper.stub(:resource).and_return(moment)
  end
  describe ".comments" do
    it "returns a post's associated comments" do
      helper.comments.first.should be_a Comment
    end
  end
  describe ".comment" do
    it "returns a freshly built comment" do
      helper.comment.should be_a Comment
    end
    it "and be associated to a post" do
      helper.comment.commentable_type.should == 'Post'
    end
  end
  describe ".resource_comments_path" do
    it "returns a new comment path for a specific post" do
      helper.stub(:resource_instance_name).and_return(moment_symbol)
      helper.resource_comments_path.should == "/posts/#{moment.id}/comments"
    end
  end
end
