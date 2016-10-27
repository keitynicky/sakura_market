require 'spec_helper'
require 'rails_helper'

RSpec.feature "ログイン後、ショッピングカート", type: :feature do
  background do
    @user = build(:user)
    login_as(@user, scope: :user)    
  end

  scenario 'ショッピングカート未追加でショッピングカートを表示すると一覧は表示されない' do
    login_as(@user, scope: :user)
    visit order_items_path
    expect(page).to have_content "ショッピングカートは空です。"
  end

  scenario '商品詳細ページでカートに追加ボタンが表示されている' do
    login_as(@user, scope: :user)
    visit root_path
    click_link 'name0'
    expect(page).to have_button 'カートに追加'
  end

  scenario '商品詳細ページから個数追加でショッピングカート画面に遷移する' do
    login_as(@user, scope: :user)
    visit root_path
    click_link 'name0'
    click_button 'カートに追加'
    expect(page).to have_content "レジに進む"
  end
end