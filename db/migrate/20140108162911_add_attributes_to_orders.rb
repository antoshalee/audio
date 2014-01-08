class AddAttributesToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :duration, :integer
    add_column :orders, :name, :string
  end
end
