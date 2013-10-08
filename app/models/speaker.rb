class Speaker < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :voice_types

  VOICE_KINDS = {
  	0 => "male",
  	1 => "female",
  	2 => "child"
  }

end
