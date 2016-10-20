class CashOnDelivery < ApplicationRecord
  scope :select_recorod_by_subtotal, ->(subtotal = 0) { where('? BETWEEN min_fee AND max_fee', subtotal).first }
end
