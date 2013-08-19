class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state, default: 'created', null: false
      t.text :description
      t.references :speaker, index: true
      t.references :client, index: true
      t.boolean :hidden
      t.integer :price

      t.timestamps
    end
  end
end
