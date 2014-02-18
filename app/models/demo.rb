# Deprecated
class Demo < ActiveRecord::Base
  belongs_to :speaker
  mount_uploader :file, AudioUploader
end
