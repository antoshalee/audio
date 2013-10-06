class RemoveSexAndAddVoiceTypeToSpeakers < ActiveRecord::Migration
  def up
    remove_column :speakers, :sex
    add_column :speakers, :voice_type, :string, null: false
    add_index :speakers, :voice_type
  end

  def down
    remove_index :speakers, :voice_type
    add_column :speakers, :sex, :boolean, null: false
    remove_column :speakers, :voice_type
  end










































































































end
