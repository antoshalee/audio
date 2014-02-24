class Speaker < ActiveRecord::Base
  extend Enumerize
  ONLINE_SCHEDULE_KEYS =
    Date::DAYNAMES.map(&:downcase) + %w(daily weekdays weekend)

  belongs_to :user
  has_many :records, as: :owner
  has_and_belongs_to_many :voice_types
  has_and_belongs_to_many :age_types
  has_and_belongs_to_many :categories,
    class_name: 'OrderCategory',
    join_table: 'categories_speakers',
    association_foreign_key: :order_category_id

  accepts_nested_attributes_for :records

  after_initialize :set_defaults
  before_validation :reject_empty_online_days

  enumerize :sex, in: {male: 0, female: 1}, scope: true
  enumerize :timbre_level, in: {low: 0, middle: 1, high: 2}, scope: true

  delegate :login, to: :user

  validates :rate, presence: true
  validate :online_schedule_must_present

  serialize :online_schedule, Hash

  include Speaker::ScopeMethods
  include Speaker::Validations

  def to_param
    login
  end

  def has_records?
    records.count > 0
  end

  private

  def set_defaults
    self.timbre_level = :middle if self.new_record? && !timbre_level
  end

  def online_schedule_must_present
    if self.online_schedule.blank?
      errors.add(:online_schedule, "should not be blank")
    end
  end

  def reject_empty_online_days
    online_schedule.reject! { |_, range| range.all?(&:blank?) }
  end

end
