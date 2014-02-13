class Order < ActiveRecord::Base
  include AASM
  DECLINES_LIMIT = 3

  belongs_to :speaker
  belongs_to :client, class_name: 'User'
  has_many :events, order: 'id asc', dependent: :destroy
  has_many :records, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :records
  validates :speaker, presence: true
  validates :state, presence: true

  aasm column: 'state' do
    state :created, :initial => true
    state :active
    state :accepted
    state :started
    state :record_attached
    state :declined
    state :clarification_asked
    state :clarified

    event :activate do
      transitions :to => :active
    end

    event :accept do
      transitions :to => :accepted
    end

    event :start do
      transitions :to => :started
    end

    event :attach_record do
      transitions :to => :record_attached
    end

    event :decline do
      transitions :to => :declined
    end

    event :reject do
      transitions :to => :rejected
    end

    event :ask_clarification do
      transitions :to => :clarification_asked
    end

    event :clarify do
      transitions :to => :clarified
    end

  end

  scope :active, ->{ where state: :active }

  def coworker_of user
    return self.speaker.user if user == self.client
    return self.client if user == self.speaker.user
    nil
  end

  def has_events?
    events.count > 0
  end

  def has_records?
    records.count > 0
  end

  def declines_remaining
    DECLINES_LIMIT - declines_count
  end

end
