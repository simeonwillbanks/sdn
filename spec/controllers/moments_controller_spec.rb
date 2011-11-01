require 'spec_helper'

describe MomentsController do

  describe "POST 'create'" do
    let(:moment) { mock_model(Moment).as_null_object }
    before { Moment.stub(:new).and_return(moment) }
      
    context "Allowed via login" do
      login_admin
      
      it "as an authenticated admin" do
        subject.current_user.admin?.should be_true
      end
      it "which creates a new moment" do
        moment.should_receive(:save)        
        post :create
      end
      it "sets a success message" do
        post :create
        flash[:notice].should eq("Moment successfully created")
      end
      it "and redirects to home" do
        post :create 
        response.should redirect_to root_url
      end
    end
    
    context "Allowed via token" do
      it "an authenticated admin can create a moment" do
        moment.should_receive(:save)
        admin = Factory(:admin)
        post :create, :auth_token => admin.authentication_token
      end
    end
    
    context "Blocked" do
      context "as an authenticated user" do
        login_user
        before { post :create }

        it "a current user exists" do
          subject.current_user.should_not be_nil
        end      
        it "but they are unauthorized" do
          response.code.should eq('401')
        end
      end

      context "as a guest" do
        before { post :create }

        it "a current user does not exist" do
           subject.current_user.should be_nil
        end
        it "and they are redirected to sign in" do
          response.should redirect_to new_user_session_url
        end
      end
    end
  end

end
