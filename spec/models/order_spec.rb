require 'spec_helper'

describe Order do

  describe "validations" do
    subject { FactoryGirl.build(:order) }

    it "has a valid factory" do
      should be_valid
    end

    it "is not valid with price less than 0" do
      subject.price = -30
      subject.should_not be_valid
    end

    it "is not valid with price equal to 0" do
      subject.price = 0
      subject.should_not be_valid
    end
  end
end
