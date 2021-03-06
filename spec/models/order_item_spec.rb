require 'rails_helper'
require 'spec_helper'

RSpec.describe OrderItem, type: :model do
  describe `#quantity` do
    context `初期状態の時` do
      it `初期値が設定されていること` do
        order_item = OrderItem.new
        expect(order_item.quantity).to eq(1)
      end
    end
  end

  describe `#total_price` do
    context `値を取得する時` do
      it `個数と価格から計算した値が取得されること` do
        order_item = OrderItem.new
        order_item.unit_price = 10
        order_item.quantity = 2
        expect(order_item.total_price).to eq(order_item.unit_price * order_item.quantity)
      end
    end
  end

  describe `#unit_price` do
    context `値を取得する時` do
      it `未保存状態の場合は商品マスターの値が取得されること` do
        product = Product.first
        order_item = OrderItem.new
        order_item.product_id = product.id
        expect(order_item.unit_price).to eq(product.price)
      end

      it `保存状態の場合はunit_priceから値が取得されること` do
        product = Product.first
        order_item = OrderItem.new
        order_item.product_id = product.id
        order_item.save
        expect(order_item.unit_price).to eq(100)
      end
    end
  end

end
