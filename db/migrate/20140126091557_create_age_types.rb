class CreateAgeTypes < ActiveRecord::Migration
  def change
    create_table :age_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
