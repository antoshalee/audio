class AddRoleNameToOrderCategories < ActiveRecord::Migration
  def change
    add_column :order_categories, :role_name, :string
  end
end
