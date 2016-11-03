require 'spec_helper'

RSpec.describe Product, type: :model do
  describe OrderItem do
    it { should belong_to(:product) }
  end

  describe `#name` do
    it { should validate_presence_of(:name) }
  end

  describe `#price` do
    it { should validate_presence_of(:price) }
  end

  describe `#description` do
    it { should validate_presence_of(:description) }
  end

  describe `#sort` do
    it { should validate_presence_of(:sort) }
  end

  describe `#can_delete?` do
    context `値取得時` do
      it `オーダーと紐付いていない場合はtrueとなっていること` do
        product = Product.new
        expect(product.can_delete?).to be_truthy
      end
    end
  end
end
