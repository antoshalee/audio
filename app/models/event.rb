class Event < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :order
  has_many :records, as: :owner
  accepts_nested_attributes_for :records

  enumerize :kind, in: %w(
    accepted
    record_attached
  )
end
