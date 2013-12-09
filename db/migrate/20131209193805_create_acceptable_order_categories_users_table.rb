class CreateAcceptableOrderCategoriesUsersTable < ActiveRecord::Migration
  def change
    create_table :acceptable_order_categories_users do |t|
      t.integer :order_category_id, null: false
      t.integer :speaker_id, null: false
    end

    add_index :acceptable_order_categories_users, :order_category_id
    add_index :acceptable_order_categories_users, :speaker_id
  end
end
