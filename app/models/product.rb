class Product < ApplicationRecord
  has_many :order_items
  attr_accessor :x, :y, :w, :h

  validates :name, presence: true
  validates :description, presence: true
  validates :sort, presence: true
  validates :price, presence: true

  paginates_per 8

  def can_delete?
    order_items.count.zero?
  end

  def set_photo input
    self.photo = File.open(input.path, 'rb').read
    unless self.h.zero? && self.w.zero?
      
    end
  end
end
