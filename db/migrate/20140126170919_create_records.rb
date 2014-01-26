class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :file

      t.timestamps
    end
  end
end
