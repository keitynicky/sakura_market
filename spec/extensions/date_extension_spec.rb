require 'spec_helper'

describe `#normal_display` do
  context `基本日付を取得する拡張メソッドで値を取得する時` do
    it `フォーマットが定義したもので日時を取得できること` do
      t = Time.zone.now 
      expect(t.normal_display).to eq(t.strftime("%Y年%m月%d日 %H:%M:%S"))
    end
  end
end