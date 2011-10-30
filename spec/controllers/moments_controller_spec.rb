require 'spec_helper'

describe MomentsController do

  describe "POST 'create'" do
    context "Allowed" do
      login_admin
      let(:moment) { mock_model(Moment).as_null_object }
      before { Moment.stub(:new).and_return(moment) }
      
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
        response.should redirect_to(:controller => "home", :action => "index")
      end
    end
    
    context "Blocked" do
      context "as an authenticated user" do
        login_user
        before { post :create }

        it "a current user exists" do
          subject.current_user.should_not be_nil
        end      
        it "but they are redirected to home" do
          response.should redirect_to(:controller => "home", :action => "index")
        end
      end

      context "as a guest" do
        before { post :create }

        it "a current user does not exist" do
           subject.current_user.should be_nil
        end
        it "and they are redirected to home" do
          response.should redirect_to(:controller => "home", :action => "index")          
        end
      end
    end
  end

end
