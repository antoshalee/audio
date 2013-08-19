class Order < ActiveRecord::Base
  include AASM
  # belongs_to :speaker
  # belongs_to :client
  validates :price, numericality: {greater_than: 0}

  aasm column: 'state' do
    state :created, :initial => true
    state :speaker_assigned

    event :assign_speaker do
      transitions :from => :created, :to => :speaker_assigned
    end

  end
end
