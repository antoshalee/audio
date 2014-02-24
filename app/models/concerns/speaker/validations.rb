class Speaker
  module Validations
    extend ActiveSupport::Concern

    included do
      validates :sex, presence: true
      validates :rate, presence: true
    end
  end
end