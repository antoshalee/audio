class RenameSpeakersCategoriesHabtmTable < ActiveRecord::Migration
  def change
    rename_table :acceptable_order_categories_users, :acceptable_order_categories_speakers
  end
end
