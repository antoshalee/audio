class Speaker
  module ScopeMethods
    extend ActiveSupport::Concern

    included do
      scope :by_order_category, ->(cat) do
      	joins(:acceptable_order_categories).
        where(acceptable_order_categories_speakers: {order_category_id: cat})
      end

      scope :with_voice_types, ->(types) do
        joins(:voice_types).
        where(speakers_voice_types: {voice_type_id: types}).uniq
      end

      scope :with_age_types, ->(types) do
        joins(:age_types).
        where(age_types_speakers: {age_type_id: types}).uniq
      end

    end

  end
end