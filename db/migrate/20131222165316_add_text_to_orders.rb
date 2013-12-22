class AddTextToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :text, :text
  end
end
