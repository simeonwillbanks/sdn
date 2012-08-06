require 'spec_helper'

describe TravelsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "dopplr is exposed" do
      subject.dopplr.should_not be_nil
    end
  end

end
