class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :update_subtotal

  TAX = 0.08

  def subtotal
    if has_order_items?
      self[:subtotal] ||= order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    end
  end

  def tax
    if has_order_items?
     self[:tax] ||=  (subtotal * TAX).to_i 
    end
  end

  private

  def has_order_items?
    order_items.size > 0
  end

  def update_subtotal
    self.subtotal = subtotal
  end

end
