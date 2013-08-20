require 'spec_helper'

describe Billing::Account do
  let(:account) { FactoryGirl.build(:billing_account) }

  describe "validations" do
    it "has a valid factory" do
      account.should be_valid
    end

    it "is not valid without user" do
      account.user = nil
      account.should_not be_valid
    end
  end

  describe "#recalculate_balance" do
    it "counts all operations and sets the balance attribute value" do
      op1 = FactoryGirl.build(:billing_operation, value: -15, account: account)
      op2 = FactoryGirl.build(:billing_operation, value: 20, account: account)
      account.operations << op1 << op2
      account.recalculate_balance
      account.balance.should == 5
    end
  end
end
