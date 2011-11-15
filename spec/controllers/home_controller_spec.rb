require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    before(:each) do
      get :index
    end
    it "returns http success" do
      response.should be_success
    end
    it "moments are exposed" do
      subject.moments.should_not be_nil
    end
    it "and each member is a moment type" do
      subject.moments.each do |type|
        type.subject.moments.size.should eq(1)
        type.subject.moments.first.should be_a Moment
      end
    end
  end

end
