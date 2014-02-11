class AddDeclinesCountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :declines_count, :integer, default: 0
  end
end
