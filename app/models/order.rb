class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :update_subtotal

  def subtotal
    if order_items.size > 0
      order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    end
  end

  private

  def update_subtotal
    self.subtotal = subtotal
  end

end
