class CreateVoiceTypes < ActiveRecord::Migration
  def change
    create_table :voice_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
