class Record < ActiveRecord::Base
  mount_uploader :file, RecordUploader
end
