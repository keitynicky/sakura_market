require 'rails_helper'
require 'spec_helper'
require 'date'

RSpec.describe Order, type: :model do

  describe OrderItem do
    it { should belong_to(:order) }
  end

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
      it `300円となっていること(各境界値のテストは、CashOnDeliveryのspecに記載)` do
        order = Order.new
        order.subtotal = 10000 - 1        
        expect(order.cash_on_delivery).to eq(300)
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

  describe `#disp_delivery_datetime` do
    context `値取得時` do
      it `配送日と配送時間のデータが取得されること` do
        order = Order.create
        order.delivery_date = Date.today
        order.delivery_time = 'hoge'
        expect(order.disp_delivery_datetime).to eq("#{order.delivery_date.strftime("%Y年%m月%d日")} #{order.delivery_time}時の間")
      end
    end
  end

  describe `#disp_updated_at` do
    context `値取得時` do
      it `更新時間のデータが取得されること` do
        order = Order.create
        expect(order.disp_updated_at).to eq("#{order.updated_at.strftime("%Y年%m月%d日 %H:%M:%S")}")
      end
    end
  end

  describe `#update_delivery` do
    context `配送情報更新時` do
      it `更新用の値が設定されること（正常系）` do
        order = Order.create
        params = {delivery_date: Date.today.strftime("%Y-%m-%d %H:%M:%S"), delivery_time: 'hoge'}
        order.update_delivery params
        expect(order.delivery_date).to eq(Date.parse params[:delivery_date])
        expect(order.delivery_time).to eq(params[:delivery_time])
      end
    end
  end

  describe `#update_delivery` do
    context `配送情報更新時` do
      it `更新用の値が設定されること（正常系）` do
        order = Order.create
        params = {delivery_date: '', delivery_time: 'hoge'}
        order.update_delivery params
        expect(order.delivery_date).to eq(nil)
        expect(order.delivery_time).to eq(params[:delivery_time])
      end
    end
  end

  describe `#total` do
    context `値取得時` do
      it `正しい値が取得されること` do
        order = Order.create
        order.subtotal = 100
        order.cash_on_delivery = 100
        order.shipping = 100
        expect(order.total).to eq(324)
      end
    end
  end

end
