class Speaker < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :records, as: :owner
  has_many :orders
  has_and_belongs_to_many :voice_types
  has_and_belongs_to_many :age_types
  has_and_belongs_to_many :categories,
    class_name: 'OrderCategory',
    join_table: 'categories_speakers',
    association_foreign_key: :order_category_id

  accepts_nested_attributes_for :records

  after_initialize :set_defaults

  enumerize :sex, in: {male: 0, female: 1}, scope: true
  enumerize :timbre_level, in: {low: 0, middle: 1, high: 2}, scope: true

  delegate :login, to: :user

  include Speaker::ScopeMethods
  include Speaker::Validations
  include Speaker::OnlineSchedule

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

end
