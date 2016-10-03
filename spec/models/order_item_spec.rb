require 'rails_helper'
require 'spec_helper'

RSpec.describe OrderItem, type: :model do
  describe "#quantity" do
    context "初期状態の時" do
      it "初期値が設定されていること" do
        order_item = OrderItem.new
        expect(order_item.quantity).to eq(1)
      end

    end
  end
end
