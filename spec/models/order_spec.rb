require 'rails_helper'
require 'spec_helper'

RSpec.describe Order, type: :model do
  describe `#subtotal` do
    context `order_itemがまだ追加されていない時` do
      it `初期値が設定されていること` do
        order = Order.new
        expect(order.subtotal).to eq(0)
      end
    end
  end

  describe `#cash_on_delivery` do
    context `購入金額が10000円未満の時` do
      it `300円となっていること` do
        order = Order.new
        order.subtotal = 10000 - 1        
        expect(order.cash_on_delivery).to eq(300)
      end
    end
    
    context `購入金額が10000円の時` do
      it `400円となっていること` do
        order = Order.new
        order.subtotal = 10000        
        expect(order.cash_on_delivery).to eq(400)
      end
    end

    context `購入金額が30,000円未満の時` do
      it `400円となっていること` do
        order = Order.new
        order.subtotal = 30000 - 1        
        expect(order.cash_on_delivery).to eq(400)
      end
    end

    context `購入金額が30,000円の時` do
      it `600円となっていること` do
        order = Order.new
        order.subtotal = 30000        
        expect(order.cash_on_delivery).to eq(600)
      end
    end

    context `購入金額が100,000円未満の時` do
      it `600円となっていること` do
        order = Order.new
        order.subtotal = 100000 - 1        
        expect(order.cash_on_delivery).to eq(600)
      end
    end

    context `購入金額が100,000円の時` do
      it `1000円となっていること` do
        order = Order.new
        order.subtotal = 100000        
        expect(order.cash_on_delivery).to eq(1000)
      end
    end

  end

  describe `#shipping` do
    context `商品が5の時` do
      it `送料は600円となっていること` do
        order = Order.create
        order_item = order.order_items.create(product: Product.all.first, quantity: 5)
        expect(order.shipping).to eq(600)
      end
    end

    context `商品が5個より上の時` do
      it `送料は600 * 2円となっていること` do
        order = Order.create
        order_item = order.order_items.create(product: Product.all.first, quantity: 5 + 1) 
        expect(order.shipping).to eq(600 * 2)
      end
    end

    context `商品が5 * 2個より上の時` do
      it `送料は600 * 3円となっていること` do
        order = Order.create
        order_item = order.order_items.create(product: Product.all.first, quantity: (5 * 2) + 1) 
        expect(order.shipping).to eq(600 * 3)
      end
    end
  end
end
