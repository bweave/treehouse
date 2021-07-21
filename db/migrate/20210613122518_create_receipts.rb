class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.string :store_name
      t.text :notes
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
