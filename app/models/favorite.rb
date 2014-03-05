class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :speaker
  validates :user_id, uniqueness: {scope: :speaker_id}
end
