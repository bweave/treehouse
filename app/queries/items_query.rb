class ItemsQuery
  def initialize(scope: ReceiptItem.all)
    @scope = scope
  end

  def totals
    scope.group_by(&:name).map do |(name, records)|
      Total.new(
        name: name,
        quantity: records.sum(&:quantity),
        total: records.sum(&:total),
      )
    end
  end

  private

  attr_reader :scope

  Total = Struct.new(:name, :quantity, :total, keyword_init: true) do
    def avg
      total.to_f / quantity
    end
  end
end
