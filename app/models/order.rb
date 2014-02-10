class Order < ActiveRecord::Base
  include AASM
  belongs_to :speaker
  belongs_to :client, class_name: 'User'
  has_many :events, order: 'id asc', dependent: :destroy
  validates :speaker, presence: true
  validates :state, presence: true
  # belongs_to :client

  # validates :price, numericality: {greater_than: 0}

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

  # alias aasm_assign_speaker assign_speaker

  # def assign_speaker speaker
  #   self.speaker = speaker
  #   aasm_assign_speaker
  # end

end
