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
    flow_click_link_product
    expect(page).to have_button 'カートに追加'
  end

  scenario '商品詳細ページから個数追加でショッピングカート画面に遷移する' do
    flow_click_add_cart
    expect(page).to have_content "レジに進む"
  end

  scenario 'ショッピングカート画面から商品名選択で商品詳細ページに遷移する' do
    flow_click_add_cart
    click_link 'name0'    
    expect(page).to have_button "カートに追加"
  end

  def flow_click_add_cart
    flow_click_link_product
    click_button 'カートに追加'    
  end

  def flow_click_link_product
    login_as(@user, scope: :user)
    visit root_path
    click_link 'name0'
  end
end