class Speaker
  module ScopeMethods
    extend ActiveSupport::Concern

    included do
      scope :by_timbre_level, ->(level) { where timbre_level: level }
    end

  end
end