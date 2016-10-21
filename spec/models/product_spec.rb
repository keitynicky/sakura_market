require 'spec_helper'

RSpec.describe Product, type: :model do
  describe OrderItem do
    it { should belong_to(:product) }
  end
end
