require 'spec_helper'

describe Billing::Account do
  describe "validations" do
    let(:account) { FactoryGirl.build(:billing_account) }

    it "has a valid factory" do
      account.should be_valid
    end

    it "is not valid without user" do
      account.user = nil
      account.should_not be_valid
    end
  end
end
