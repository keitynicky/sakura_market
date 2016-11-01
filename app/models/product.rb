class Product < ApplicationRecord
  has_many :order_items

  validates :name, presence: true
  validates :description, presence: true
  validates :sort, presence: true
  validates :price, presence: true

  paginates_per 8
end
