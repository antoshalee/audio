class AddMarkedTextToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :marked_text, :text
  end
end
