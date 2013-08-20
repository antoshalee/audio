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

    context "when sender balance is equal to value of transfer" do
      let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 100) }
      it { should be_transfer_possible }
    end

  end

  describe "#transfer" do

    context "when transfer is possible" do
      before(:each) { manager.transfer }
      let(:transfer_obj) { Billing::Transfer.first }

      describe "result transfer object" do
        it { Billing::Transfer.count.should == 1 }
        it { transfer_obj.value.should == 100 }
        it { transfer_obj.sender_account.should == sender_acc }
        it { transfer_obj.recipient_account.should == recipient_acc }
      end

      it "creates account operations for sender and recipient" do
        Billing::Operation.count.should == 2
      end

      describe "result sender's account operation" do
        subject(:op) { sender_acc.operations.first }
        it { op.value.should == -100 }
        it { op.document.should == transfer_obj }
      end

      describe "result recipient's account operation" do
        subject(:op) { recipient_acc.operations.first }
        it { op.value.should == 100 }
        it { op.document.should == transfer_obj }
      end
    end

    context "when transfer is not possible" do
      let(:sender_acc)    { FactoryGirl.build(:billing_account, balance: 50) }

      it "raise an error" do
        lambda { manager.transfer }.should raise_error(Billing::Errors::TransferIsNotPossible)
      end
    end

  end
end