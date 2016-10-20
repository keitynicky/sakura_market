class Product < ApplicationRecord
  has_many :shopping_carts
  has_many :order_items

  paginates_per 8
end
