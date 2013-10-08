class Speaker < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :voice_types

  VOICE_KINDS = %w(male female child)

end
