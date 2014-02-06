class Order < ActiveRecord::Base
  include AASM
  belongs_to :speaker
  belongs_to :client, class_name: 'User'
  has_many :events, order: 'id asc'
  validates :speaker, presence: true
  validates :state, presence: true
  # belongs_to :client

  # validates :price, numericality: {greater_than: 0}

  aasm column: 'state' do
    state :created, :initial => true
    state :active
    state :accepted

    event :activate do
      transitions :to => :active
    end

    event :accept do
      transitions :to => :accepted
    end

  end

  scope :active, ->{ where state: :active }

  # alias aasm_assign_speaker assign_speaker

  # def assign_speaker speaker
  #   self.speaker = speaker
  #   aasm_assign_speaker
  # end

end
