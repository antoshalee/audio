class AddPositionToVoiceType < ActiveRecord::Migration
  def change
    add_column :voice_types, :position, :integer
  end
end
