class Record < ActiveRecord::Base
  mount_uploader :file, AudioUploader
  belongs_to :owner, polymorphic: true
end
