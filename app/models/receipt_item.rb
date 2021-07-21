class ReceiptItem < ApplicationRecord
  belongs_to :receipt

  validates :name, presence: true
  validates :price_cents, presence: true
  validates :quantity, presence: true

  def self.item_names
    distinct(:name).order(:name).pluck(:name)
  end

  def total
    price_cents / 100.0 * quantity
  end
end
