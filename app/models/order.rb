class Order < ActiveRecord::Base
  # belongs_to :speaker
  # belongs_to :client
  validates :price, numericality: {greater_than: 0}
end
