class SpeakerDecorator < Draper::Decorator
  delegate_all

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

  private

  def downcase_and_join collection
    collection.map { |el| el.name.mb_chars.downcase }.join ", "
  end

end
