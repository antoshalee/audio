class Record < ActiveRecord::Base
  mount_uploader :file, AudioUploader
  belongs_to :owner, polymorphic: true
  before_save :set_default_title

  private

  def set_default_title
    self.title ||= file.file.basename
  end

end
