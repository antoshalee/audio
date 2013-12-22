class Speaker < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_and_belongs_to_many :voice_types
  has_and_belongs_to_many :acceptable_order_categories,
    class_name: 'OrderCategory',
    join_table: 'acceptable_order_categories_users',
    association_foreign_key: :order_category_id

  after_initialize :set_defaults

  enumerize :sex, in: {male: 0, female: 1}
  enumerize :timbre_level, in: {low: 0, middle: 1, high: 2}

  include Speaker::Validations

  private

  def set_defaults
    self.timbre_level = 1 if self.new_record?
  end

end
