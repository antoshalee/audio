class RenameHabtmTable < ActiveRecord::Migration
  def change
    rename_table :acceptable_order_categories_speakers, :categories_speakers
  end
end
