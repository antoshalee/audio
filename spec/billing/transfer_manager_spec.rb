require 'spec_helper'

describe Billing::TransferManager do
  let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 1000) }
  let(:recipient_acc) { FactoryGirl.build(:billing_account, balance: 500) }
  let(:manager)       { Billing::TransferManager.new(sender_acc, recipient_acc, 100) }
  let(:subject)       { manager }

  describe "#transfer_possible?" do
    it "checks the possibility of transfer" do
      manager.transfer_possible?.should be_true
    end

    context "without sender" do
      let(:sender_acc) { nil }
      it { should_not be_transfer_possible }
    end

    context "without recipient" do
      let(:recipient_acc) { nil }
      it { should_not be_transfer_possible }
    end

    context "when sender balance is less than value of transfer" do
      let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 50) }
      it { should_not be_transfer_possible }
    end

    context "where sender balance is equal to value of transfer" do
      let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 100) }
      it { should be_transfer_possible }
    end

  end

  describe "#transfer" do
    it "creates transfer" do
      manager.transfer
      Billing::Transfer.count.should == 1
    end

    context "when transfer is not possible" do
      let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 50) }

      it "raise an error" do
        lambda { manager.transfer }.should raise_error(Billing::Errors::TransferIsNotPossible)
      end
    end

  end
end