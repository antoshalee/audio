class CreateOrderCategories < ActiveRecord::Migration
  def change
    create_table :order_categories do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
