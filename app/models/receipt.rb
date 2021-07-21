class Receipt < ApplicationRecord
  has_many :receipt_items, dependent: :destroy, inverse_of: :receipt

  validates :store_name, presence: true
  validates :purchased_at, presence: true

  accepts_nested_attributes_for :receipt_items, reject_if: :all_blank, allow_destroy: true

  def self.store_names
    distinct(:store_name).order(:store_name).pluck(:store_name)
  end

  def total
    items_total = receipt_items.sum { |ri| ri.quantity * ri.price_cents / 100.0 }
    items_total + (sales_tax_cents / 100.0)
  end
end
