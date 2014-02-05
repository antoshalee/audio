class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :kind, null: false
      t.text :message
      t.references :user, index: true, null: false
      t.references :order, index: true, null: false

      t.timestamps
    end
  end
end
