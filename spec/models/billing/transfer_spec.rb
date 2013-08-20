require 'spec_helper'

describe Billing::Transfer do
  let(:transfer) { FactoryGirl.build(:billing_transfer) }

  describe "validations" do
    it "has a valid factory" do
      transfer.should be_valid
    end

    it "is not valid with value less than 0" do
      transfer.value = -30
      transfer.should_not be_valid
    end

    it "is not valid with value equal to 0" do
      transfer.value = 0
      transfer.should_not be_valid
    end

    it "is not valid without sender" do
      transfer.sender_account = nil
      transfer.should_not be_valid
    end

    it "is not valid without recipient" do
      transfer.recipient_account = nil
      transfer.should_not be_valid
    end

  end
end
