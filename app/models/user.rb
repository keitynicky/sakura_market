class User < ApplicationRecord
  has_many :shopping_carts
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def disp_address
    "#{self.address_level1} #{self.address_level2} #{self.address_line1} #{self.address_line2}"
  end

  def disp_user_name
    "#{self.family_name} #{self.given_name}様"
  end
end
