class CreateBillingTransfers < ActiveRecord::Migration
  def change
    create_table :billing_transfers do |t|
      t.integer :value
      t.references :recipient_account, index: true
      t.references :sender_account, index: true

      t.timestamps
    end
  end
end
