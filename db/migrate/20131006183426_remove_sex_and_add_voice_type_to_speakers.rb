class RemoveSexAndAddVoiceTypeToSpeakers < ActiveRecord::Migration
  def up
    remove_column :speakers, :sex
    add_column :speakers, :voice_kind, :string, null: false
    add_index :speakers, :voice_kind
  end

  def down
    remove_index :speakers, :voice_kind
    add_column :speakers, :sex, :boolean, null: false
    remove_column :speakers, :voice_kind
  end










































































































end
