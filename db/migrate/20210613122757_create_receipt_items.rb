class CreateReceiptItems < ActiveRecord::Migration[6.1]
  def change
    create_table :receipt_items do |t|
      t.references :receipt, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price_cents, default: 0
      t.integer :quantity, default: 0

      t.timestamps
    end
  end
end
