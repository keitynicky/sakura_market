class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  TAX = 0.08
  SHIPPING_COUNT = 6
  SHIPPING_FEE = 600

  def subtotal
    if has_order_items?
      self[:subtotal] ||= order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    end
  end

  def tax
    if has_order_items?
     self[:tax] ||=  get_tax get_total_net_of_tax
    end
  end

  def cash_on_delivery
    if has_order_items?
     self[:cash_on_delivery] ||= get_cash_on_delivery 
    end
  end

  def shipping
    if has_order_items?
     self[:shipping] ||= get_shipping 
    end
  end

  def total
    if has_order_items?
     self[:total] ||= get_total 
    end
  end

  private

  def has_order_items?
    order_items.size > 0
  end

  def get_cash_on_delivery
    CashOnDelivery.select_recorod_by_subtotal(subtotal).cost
  end

  def get_shipping
    SHIPPING_FEE * (order_items.size.div(SHIPPING_COUNT) + 1)
  end

  def get_total_net_of_tax
    subtotal + cash_on_delivery + shipping
  end

  def get_tax target
     (target * TAX).to_i
  end

  def get_total
    get_total_net_of_tax + tax
  end

end
