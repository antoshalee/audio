class AgeType < ActiveRecord::Base
  has_and_belongs_to_many :speakers
  acts_as_list
end
