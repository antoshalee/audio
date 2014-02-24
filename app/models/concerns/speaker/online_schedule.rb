class Speaker
  module OnlineSchedule
    extend ActiveSupport::Concern

    ONLINE_SCHEDULE_KEYS =
      Date::DAYNAMES.map(&:downcase) + %w(daily weekdays weekend)

    included do
      serialize :online_schedule, Hash
      before_validation :reject_empty_online_days
    end

    private

    def reject_empty_online_days
      online_schedule.reject! { |_, range| range.all?(&:blank?) }
    end
  end
end