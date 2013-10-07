class CreateTableSpeakersVoiceTypes < ActiveRecord::Migration
  def change
    create_table :speakers_voice_types do |t|
      t.references :speaker
      t.references :voice_type
    end
    add_index :speakers_voice_types, :speaker_id
    add_index :speakers_voice_types, :voice_type_id
  end
end
