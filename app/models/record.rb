class Record < ActiveRecord::Base
  mount_uploader :file, AudioUploader
end
