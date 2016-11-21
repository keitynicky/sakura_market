require 'rubygems'
if RUBY_PLATFORM.match(/linux/)
  require 'rmagick'
end

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
    unless input.nil?
      unless self.h.to_i.zero?
        original = Magick::Image.read(input.path).first
        self.photo = original.crop(self.x.to_i, self.y.to_i, self.w.to_i, self.h.to_i).to_blob
      else
        self.photo = File.open(input.path, 'rb').read
      end
    end
  end
end
