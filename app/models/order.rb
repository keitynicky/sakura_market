class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  TAX = 0.08
  SHIPPING_COUNT = 5
  SHIPPING_FEE = 600

  def subtotal
    self[:subtotal] ||= order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def tax
    self[:tax] ||=  get_tax get_total_net_of_tax
  end

  def cash_on_delivery
    self[:cash_on_delivery] ||= get_cash_on_delivery 
  end

  def shipping
    self[:shipping] ||= get_shipping 
  end

  def total
    self[:total] ||= get_total 
  end

  private

  def get_cash_on_delivery
    CashOnDelivery.select_recorod_by_subtotal(subtotal).cost
  end

  def get_shipping
    quantities = order_items.calculate(:sum, "quantity")
    SHIPPING_FEE * (((quantities - 1) / SHIPPING_COUNT) + 1)
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
