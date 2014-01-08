class Order < ActiveRecord::Base
  include AASM
  belongs_to :speaker
  validates :speaker, presence: true
  # belongs_to :client

  # validates :price, numericality: {greater_than: 0}

  aasm column: 'state' do
    state :created, :initial => true
    state :speaker_assigned

    event :assign_speaker do
      transitions :from => :created, :to => :speaker_assigned
    end
  end

  alias aasm_assign_speaker assign_speaker

  def assign_speaker speaker
    self.speaker = speaker
    aasm_assign_speaker
  end

end
