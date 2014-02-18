class AddRateToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :rate, :integer
  end
end
