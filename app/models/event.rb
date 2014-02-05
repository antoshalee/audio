class Event < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :order

  enumerize :kind, in: %w(
    accepted
  )
end
