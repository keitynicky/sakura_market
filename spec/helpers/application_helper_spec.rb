require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe `#disp_money` do
    context `値取得時` do
      it `金額フォーマットで取得できること` do
        money = 1000
        expect(disp_money(money)).to eq(number_to_currency(money, format: '%u%n', unit: '￥', precision: 0))
      end
    end
  end

  describe `#disp_number` do
    context `値取得時` do
      it `数値フォーマットで取得できること` do
        target = 1000
        expect(disp_number(target)).to eq(number_with_delimiter(target, delimiter: ','))
      end
    end
  end
end
