class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  before_save :finalize

  DEFAULT_QUANTITY = 1

  def quantity
    self[:quantity] ||= DEFAULT_QUANTITY
  end

  def unit_price
    if persisted?
      # TODO 同名の列との識別のため下記のようなアクセスの仕方を設定している。
      self[:unit_price]
    else
      product.price
    end
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
