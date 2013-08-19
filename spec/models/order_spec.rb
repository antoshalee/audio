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

  describe "transfers" do
    it "has 'created' state by default" do
      subject.save
      subject.state.should == "created"
    end

    describe '#assign_speaker' do

      let(:speaker) { FactoryGirl.build(:speaker)}

      before(:each) { subject.assign_speaker(speaker) }

      it "changes state to 'speaker_assigned'" do
        subject.state.should == "speaker_assigned"
      end

      it 'sets speaker association' do
        subject.speaker.should == speaker
      end
    end

  end
end
