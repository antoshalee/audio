require 'spec_helper'

describe RecordsController do

  describe "GET 'cache'" do
    it "returns http success" do
      get 'cache'
      response.should be_success
    end
  end

end
