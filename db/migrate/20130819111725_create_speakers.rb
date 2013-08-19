class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.references :user, index: true
      t.string :account_number

      t.timestamps
    end
  end
end
