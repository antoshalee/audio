class AddOnlineScheduleToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :online_schedule, :text
  end
end
