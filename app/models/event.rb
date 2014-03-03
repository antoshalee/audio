class Event < ActiveRecord::Base
  extend Enumerize

  after_create :increment_order_declines_count,   if: :declined?
  after_destroy :decrement_order_declines_count,  if: :declined?

  belongs_to :user
  belongs_to :order
  has_many :records, as: :owner, dependent: :destroy
  accepts_nested_attributes_for :records

  enumerize :kind, in: %w(
  	started
    denied_by_speaker
  	declined
    accepted
    record_attached
    clarification_asked
    clarified
  ), predicates: true

  self.kind.values.each do |k|
    scope k, where(kind: k)
  end

  private

  def increment_order_declines_count
    Order.increment_counter(:declines_count, self.order_id)
  end

  def decrement_order_declines_count
    Order.decrement_counter(:declines_count, self.order_id)
  end

end
