# encoding: utf-8
shared_context "moment" do
  let(:new_moment) { FactoryGirl.create(moment) }
  before { new_moment }
  describe "GET 'index'" do
    before(:each) do 
      get :index
    end
    it "assigns collection of moments" do
      assigns(moment.to_s.pluralize.to_sym).should eq([new_moment])
    end    
    it "has a 200 status code" do
      response.code.should eq("200")
    end    
    it "renders the index template" do
      response.should render_template("index")
    end    
  end
  describe "GET 'show'" do
    before(:each) do 
      get :show, :id => new_moment.id
    end
    it "assigns a moment" do
      assigns(moment).should eq(new_moment)
    end    
    it "has a 200 status code" do
      response.code.should eq("200")
    end    
    it "renders the show template" do
      response.should render_template("show")
    end    
  end
  describe "POST 'create'" do
    context "Blocked" do
      context "as an authenticated user" do
        login_user
        before { post :create }
        it "a current user exists" do
          subject.current_user.should_not be_nil
        end      
        it "but they are unauthorized" do
          response.code.should eq("401")
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
