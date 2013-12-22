class AddSexToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :sex, :integer, null: false
    add_index :speakers, :sex
  end
end
