class AddSalesTaxCentsToReceipts < ActiveRecord::Migration[6.1]
  def change
    add_column :receipts, :sales_tax_cents, :integer, default: 0
  end
end
