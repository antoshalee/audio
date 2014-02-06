class AddPolymorphicAttributesToRecords < ActiveRecord::Migration
  def change
    add_column :records, :owner_id, :integer, null: false
    add_column :records, :owner_type, :string, null: false
    add_index :records, :owner_id
  end
end
