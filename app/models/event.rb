class Event < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :order
  has_many :records, as: :owner
  accepts_nested_attributes_for :records

  enumerize :kind, in: %w(
  	started
  	declined
    accepted
    record_attached
  ), predicates: true
end
