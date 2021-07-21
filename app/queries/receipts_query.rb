class ReceiptsQuery
  def initialize(scope: Receipt.all)
    @scope = scope
  end

  def grand_total
    scope.sum(&:total)
  end

  private

  attr_reader :scope
end
