class AddTitleToRecords < ActiveRecord::Migration
  def change
    add_column :records, :title, :string
  end
end
