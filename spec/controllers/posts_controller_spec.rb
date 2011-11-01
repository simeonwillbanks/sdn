require 'spec_helper'

describe PostsController do

  describe "POST 'create'" do
    let(:admin) { Factory(:admin) }
    let(:mock_post) { mock_model(Post).as_null_object }
    before(:each) do
      # An ActionController::TestRequest, representing the current HTTP
      # request. You can modify this object before sending the HTTP request.
      # @see ActionController::TestCase 
      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["CONTENT_TYPE"] = "application/json"
    end
    
    context "Allowed via login" do
      login_admin
      it "as an authenticated admin" do
        subject.current_user.admin?.should be_true
      end
      it "create a new post" do
        Post.stub(:new).and_return(mock_post) 
        mock_post.should_receive(:save)        
        post :create, :headline => "Dogs like peanut butter", :body => "MMMmmm peanut butter"
        response.response_code.should == 201
      end
      it "and render the post" do
        post :create, :headline => "Dogs like peanut butter", :body => "MMMmmm peanut butter"
        assigns(:post).headline.should == "Dogs like peanut butter"
      end
    end

    context "Allowed via token" do
      it "an authenticated admin can create a post" do
        post :create, :auth_token => admin.authentication_token, :headline => "Dogs like peanut butter", :body => "MMMmmm peanut butter"
        response.response_code.should == 201
      end
    end

    context "Blocked" do
      it "when request is made as HTML" do
        @request.env["HTTP_ACCEPT"] = "text/html"
        @request.env["CONTENT_TYPE"] = "text/html"
        post :create, :auth_token => admin.authentication_token, :headline => "Dogs like peanut butter", :body => "MMMmmm peanut butter"
        # Not Acceptable
        # The resource identified by the request is only capable of generating 
        # response entities which have content characteristics not acceptable 
        # according to the accept headers sent in the request.
        response.response_code.should == 406
      end
    end
  end
  
end
