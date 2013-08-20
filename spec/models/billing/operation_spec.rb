require 'spec_helper'

describe Billing::Operation do
  let(:operation) { FactoryGirl.build(:billing_operation) }

  describe "validations" do
    it "has a valid factory" do
      operation.should be_valid
    end

    it "is not valid without account" do
      operation.account = nil
      operation.should_not be_valid
    end

  end

  it "forces account to recalculate itself after creation" do
    operation.account.should_receive(:recalculate_balance)
    operation.save
  end

end
