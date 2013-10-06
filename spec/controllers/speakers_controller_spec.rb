require 'spec_helper'

describe SpeakersController do
  describe "GET #index" do
    it "populates speakers" do
      speaker = FactoryGirl.create(:speaker)
      get :index


      assigns(:speakers).should eq([speaker])
    end
  end
end