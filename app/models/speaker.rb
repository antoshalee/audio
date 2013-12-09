class Speaker < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :voice_types
  has_and_belongs_to_many :acceptable_order_categories,
    class_name: 'OrderCategory',
    join_table: 'acceptable_order_categories_users',
    association_foreign_key: :order_category_id

  VOICE_KINDS = {
  	0 => "male",
  	1 => "female",
  	2 => "child"
  }

end
