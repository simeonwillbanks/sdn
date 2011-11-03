shared_context "moment" do
  describe "POST 'create'" do
    context "Blocked" do
      context "as an authenticated user" do
        login_user
        before { post :create }
        it "a current user exists" do
          subject.current_user.should_not be_nil
        end      
        it "but they are unauthorized" do
          response.response_code.should eq(401)
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
