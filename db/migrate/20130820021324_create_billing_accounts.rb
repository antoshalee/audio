class CreateBillingAccounts < ActiveRecord::Migration
  def change
    create_table :billing_accounts do |t|
      t.integer :balance
      t.references :user, index: true

      t.timestamps
    end
  end
end
