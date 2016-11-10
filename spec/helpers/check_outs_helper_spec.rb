require 'rails_helper'

RSpec.describe CheckOutsHelper, type: :helper do
  describe `#get_progress_info` do
    context `引数1 値取得時` do
      it `御購入進捗状況を取得できること` do
        tmp = get_progress_info 1
        expect(tmp.one_class).to eq("primary-color")
        expect(tmp.two_class).to eq("no-color")
        expect(tmp.three_class).to eq("no-color")
        expect(tmp.four_class).to eq("no-color")        
      end
    end

    context `引数2 値取得時` do
      it `御購入進捗状況を取得できること` do
        tmp = get_progress_info 2
        expect(tmp.one_class).to eq("primary-color")
        expect(tmp.two_class).to eq("primary-color")
        expect(tmp.three_class).to eq("no-color")
        expect(tmp.four_class).to eq("no-color")        
      end
    end

    context `引数3 値取得時` do
      it `御購入進捗状況を取得できること` do
        tmp = get_progress_info 3
        expect(tmp.one_class).to eq("primary-color")
        expect(tmp.two_class).to eq("primary-color")
        expect(tmp.three_class).to eq("primary-color")
        expect(tmp.four_class).to eq("no-color")        
      end
    end

    context `引数4 値取得時` do
      it `御購入進捗状況を取得できること` do
        tmp = get_progress_info 4
        expect(tmp.one_class).to eq("primary-color")
        expect(tmp.two_class).to eq("primary-color")
        expect(tmp.three_class).to eq("primary-color")
        expect(tmp.four_class).to eq("primary-color")        
      end
    end
  end
end
