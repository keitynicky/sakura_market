class User < ApplicationRecord
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :postal_code, presence: true, on: :checkout
  validates :address_level1, presence: true, on: :checkout
  validates :address_level2, presence: true, on: :checkout
  validates :family_name, presence: true, on: :checkout
  validates :given_name, presence: true, on: :checkout

  def phurchased_orders?
    orders.where(is_phurchased: true).order('updated_at DESC')
  end

  def disp_address
    "#{address_level1} #{address_level2} #{address_line1} #{address_line2}"
  end

  def disp_user_name
    "#{family_name} #{given_name}様"
  end
end
