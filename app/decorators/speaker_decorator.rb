class SpeakerDecorator < Draper::Decorator
  delegate_all

  def role_text
    categories.map { |cat| cat.role_name.presence.mb_chars.downcase.to_s }.
      compact.uniq.join ", "
  end

  def sex_text
    sex.text.mb_chars.downcase
  end

  def timbre_text
    timbre_level.text.mb_chars.downcase
  end

  def categories_text
    downcase_and_join(categories)
  end

  def voice_types_text
    downcase_and_join(voice_types)
  end

  def age_types_text
    downcase_and_join(age_types)
  end

  def online_text
    if online_schedule.key? 'daily'
      "Ежедневно, #{online_timerange_text(online_schedule['daily'])}"
    elsif online_schedule.key? 'weekdays'
      "ПН-ПТ, #{online_timerange_text(online_schedule['weekdays'])}"
    elsif online_schedule.key? 'weekend'
      "СБ-ВС, #{online_timerange_text(online_schedule['weekend'])}"
    else
      online_schedule.keys.map { |d| I18n.t("short_weekdays.#{d}") }.join ", "
    end
  end

  private

  def downcase_and_join collection
    collection.map { |el| el.name.mb_chars.downcase }.join ", "
  end

  def online_timerange_text(range)
    "#{range[0]}–#{range[1]}"
  end

end
