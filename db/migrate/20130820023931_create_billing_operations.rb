class CreateBillingOperations < ActiveRecord::Migration
  def change
    create_table :billing_operations do |t|
      t.references :account, index: true, null: false
      t.references :document, index: true, polymorphic: true, null: false
      t.integer :value

      t.timestamps
    end
  end
end
