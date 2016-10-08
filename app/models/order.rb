class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :update_calc_value

  TAX = 0.08
  SHIPPING_COUNT = 6
  SHIPPING_FEE = 600
  # TODO定数名要リファクタ。可能であればenumとかにする！
  CASH_ON_DELIVERY_1 = 10000
  CASH_ON_DELIVERY_2 = 30000
  CASH_ON_DELIVERY_3 = 100000

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

  # TODO要定数
  def get_cash_on_delivery
    case subtotal
      when 0...CASH_ON_DELIVERY_1 then 300
      when CASH_ON_DELIVERY_1...CASH_ON_DELIVERY_2 then 400
      when CASH_ON_DELIVERY_2...CASH_ON_DELIVERY_3 then 600
      else 1000
    end
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

  def update_calc_value
    self.subtotal = subtotal
    self.tax = tax
    self.cash_on_delivery = cash_on_delivery
    self.shipping = shipping
    self.total = total
  end
end
