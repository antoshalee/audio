class Order < ActiveRecord::Base
  include AASM
  belongs_to :speaker
  belongs_to :client, class_name: 'User'
  has_many :events, order: 'id asc', dependent: :destroy
  validates :speaker, presence: true
  validates :state, presence: true

  aasm column: 'state' do
    state :created, :initial => true
    state :active
    state :accepted
    state :started
    state :record_attached
    state :declined

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

  end

  scope :active, ->{ where state: :active }

  def coworker_of user
    return self.speaker.user if user == self.client
    return self.client if user == self.speaker.user
    nil
  end

end
