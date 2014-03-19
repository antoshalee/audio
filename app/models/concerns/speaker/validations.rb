class Speaker
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :sex, presence: true
      validates :rate, presence: true
      validate :validate_records
    end

    def validate_records
      errors.add(:records, "отсутствуют") if records.size == 0
    end

  end
end
