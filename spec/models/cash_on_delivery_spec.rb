require 'spec_helper'

RSpec.describe CashOnDelivery, type: :model do
  describe `#select_recorod_by_subtotal` do
    context `購入金額が10000円未満の時` do
      it `300円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(10000 - 1).cost).to eq(300)
      end
    end
  end

  describe `#select_recorod_by_subtotal` do
    context `購入金額が10000円の時` do
      it `400円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(10000).cost).to eq(400)
      end
    end
  end

  describe `#select_recorod_by_subtotal` do
    context `購入金額が30,000円未満の時` do
      it `400円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(30000 - 1).cost).to eq(400)
      end
    end
  end

  describe `#select_recorod_by_subtotal` do
    context `購入金額が30,000円の時` do
      it `600円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(30000).cost).to eq(600)
      end
    end
  end

  describe `#select_recorod_by_subtotal` do
    context `購入金額が100,000円未満の時` do
      it `600円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(100000 - 1).cost).to eq(600)
      end
    end
  end

  describe `#select_recorod_by_subtotal` do
    context `購入金額が100,000円の時` do
      it `1000円となっていること` do
        expect(CashOnDelivery.select_recorod_by_subtotal(100000).cost).to eq(1000)
      end
    end
  end
end