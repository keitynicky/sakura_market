class Product < ApplicationRecord
  has_many :order_items
  has_attached_file :image, styles: {thumb: '100x80', medium: '250x200'}
  crop_attached_file :image , aspect: '5:4'
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
