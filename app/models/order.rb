require 'date'

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :delivery_date, presence: true, on: :checkout

  TAX = 0.08
  SHIPPING_COUNT = 5
  SHIPPING_FEE = 600

  def subtotal
    self[:subtotal] ||= order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def tax
    self[:tax] ||= (total_net_of_tax * TAX).to_i
  end

  def cash_on_delivery
    self[:cash_on_delivery] ||= subtotal_cost
  end

  def shipping
    self[:shipping] ||= shipping_by_quantities
  end

  def total
    self[:total] ||= total_net_of_tax + tax
  end

  def disp_delivery_datetime
    "#{self[:delivery_date].strftime("%Y年%m月%d日")} #{self[:delivery_time]}時の間"
  end

  def disp_updated_at
    "#{self[:updated_at].strftime("%Y年%m月%d日 %H:%M:%S")}"
  end

  def update_delivery(order_params)
    unless order_params[:delivery_date].empty?
      self.delivery_date = Date.parse order_params[:delivery_date]
    end
    self.delivery_time = order_params[:delivery_time]
  end

  def update_is_phurchased
    self.is_phurchased = true
    self.subtotal = subtotal
    self.tax = tax
    self.shipping = shipping
    self.cash_on_delivery = cash_on_delivery
    self.total = total

    self.save(context: :checkout)
  end

  private

  def subtotal_cost
    CashOnDelivery.select_recorod_by_subtotal(subtotal).cost
  end

  def shipping_by_quantities
    quantities = order_items.sum(:quantity)
    SHIPPING_FEE * (((quantities - 1) / SHIPPING_COUNT) + 1)
  end

  def total_net_of_tax
    subtotal + cash_on_delivery + shipping
  end
end
