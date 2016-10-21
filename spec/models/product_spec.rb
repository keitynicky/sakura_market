require 'spec_helper'

RSpec.describe Product, type: :model do
  describe OrderItem do
    it { should belong_to(:Product) }
  end

  # describe Product do
  #   it "should have many teams" do
  #     t = Product.reflect_on_association(:order_items)
  #     t.macro.should == :has_many
  #   end
  # end
end
