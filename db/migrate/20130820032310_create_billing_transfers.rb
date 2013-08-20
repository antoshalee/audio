class CreateBillingTransfers < ActiveRecord::Migration
  def change
    create_table :billing_transfers do |t|
      t.integer :value, null: false
      t.references :recipient_account, index: true, null: false
      t.references :sender_account, index: true, null: false

      t.timestamps
    end
  end
end
