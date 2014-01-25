class Speaker
  module ScopeMethods
    extend ActiveSupport::Concern

    included do
      scope :by_timbre_level, ->(level) { where timbre_level: level }
      scope :by_order_category, ->(cat) do
      	joins(:acceptable_order_categories).
        where(acceptable_order_categories_speakers: {order_category_id: cat})
      end
    end

  end
end