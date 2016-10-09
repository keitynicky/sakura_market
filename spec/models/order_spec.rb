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
end
