require 'spec_helper'

RSpec.describe User, type: :model do

  describe `#特定の場合のみ空白を許容する項目` do
    context `保存時` do
      it `checkoutでなければ空白でも保存できること` do
        user = build(:user)
        be_true(user.save)
      end

      it `checkoutであれば空白は保存できないこと` do
        user = build(:user)
        be_false(user.save(context: :checkout))
      end

      it `checkoutであれば空白でなければ保存できること` do
        user = build(:user)
        user.postal_code = 'postal_code'
        user.address_level1 = "address_level1"
        user.address_level2 = "address_level2"
        user.family_name = "family_name"
        user.given_name = "given_name"
        be_true(user.save(context: :checkout))
      end
    end
  end

  describe `#disp_address` do
    context `値取得時` do
      it `住所すべてが連結されて取得できること` do
        user = User.new
        user.address_level1 = "address_level1"
        user.address_level2 = "address_level2"
        user.address_line1 = "address_line1"
        user.address_line2 = "address_line2"
        expect(user.disp_address).to eq("#{user.address_level1} #{user.address_level2} #{user.address_line1} #{user.address_line2}")
      end
    end
  end

  describe `#disp_user_name` do
    context `値取得時` do
      it `氏名が連結されて取得できること` do
        user = User.new
        user.family_name = "family_name"
        user.given_name = "given_name"
        expect(user.disp_user_name).to eq("#{user.family_name} #{user.given_name}様")
      end
    end
  end
end
