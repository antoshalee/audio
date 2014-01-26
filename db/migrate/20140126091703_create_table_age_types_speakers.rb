class CreateTableAgeTypesSpeakers < ActiveRecord::Migration
  def change
    create_table :age_types_speakers do |t|
      t.references :age_type
      t.references :speaker
    end
    add_index :age_types_speakers, :age_type_id
    add_index :age_types_speakers, :speaker_id
  end
end
