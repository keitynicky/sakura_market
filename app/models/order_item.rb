class OrderItem < ApplicationRecord
  belongs_to :order, touch: true
  belongs_to :product

  DEFAULT_QUANTITY = 1
  MAX_QUANTITY = 1000000

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: DEFAULT_QUANTITY, less_than: MAX_QUANTITY}

  before_save :finalize

  def quantity
    self[:quantity] ||= DEFAULT_QUANTITY
  end

  def unit_price
    # TODO 同名の列との識別のため下記のようなアクセスの仕方を設定している。
    self[:unit_price] ||= product.price
  end

  def total_price
    unit_price * quantity
  end

private
  def finalize
    self.unit_price = unit_price
    self.total_price = quantity * self.unit_price
  end
end
