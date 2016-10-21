class Product < ApplicationRecord
  has_many :order_items

  paginates_per 8
end
