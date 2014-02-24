class Speaker
  module OnlineSchedule
    extend ActiveSupport::Concern

    ONLINE_SCHEDULE_KEYS =
      Date::DAYNAMES.map(&:downcase) + %w(daily weekdays weekend)

    included do
      serialize :online_schedule, Hash
      before_validation :reject_empty_online_days
    end

    def refresh_online_attribute!
      if should_be_online?
        self.update_column(:online, true)
      else
        self.update_column(:online, false)
      end
    end

    private

    def should_be_online?
      now = Time.zone.now
      range = online_schedule[current_dayname]
      if range.present?
        range = range.map { |t| Time.zone.parse t }
        return true if now.between?(range[0], range[1])
      end
      false
    end

    # 'monday', 'tuesday' etc
    def current_dayname
      Time.zone.now.strftime("%A").downcase
    end

    def reject_empty_online_days
      online_schedule.reject! { |_, range| range.all?(&:blank?) }
    end
  end
end