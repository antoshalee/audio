class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :file
      t.references :speaker

      t.timestamps
    end
    add_index :demos, :speaker_id
  end
end
