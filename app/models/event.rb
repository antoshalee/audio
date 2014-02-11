class Event < ActiveRecord::Base
  extend Enumerize

  after_create :increment_order_declines_count

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

  private

  def increment_order_declines_count
    if self.declined?
      Order.increment_counter(:declines_count, self.order_id)
    end
  end

end
