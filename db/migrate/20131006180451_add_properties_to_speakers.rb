class AddPropertiesToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :sex, :boolean, null: false
    add_column :speakers, :timbre_level, :integer, null: false
  end
end
