class AddOnlineAttributesToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :online, :boolean, default: false
    add_column :speakers, :online_next_refresh, :datetime
    add_index :speakers, :online_next_refresh
  end
end
