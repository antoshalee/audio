class DeleteVoiceKindFromSpeakers < ActiveRecord::Migration
  def up
    remove_column :speakers, :voice_kind
  end

  def down
    add_column :speakers, :voice_kind, :integer, null: false
  end

end
