class AddPropertiesToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :timbre_level, :integer, null: false
    add_column :speakers, :voice_kind, :integer, null: false
  end
end
