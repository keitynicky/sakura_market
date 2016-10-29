require 'spec_helper'
require 'rails_helper'
require 'date'

RSpec.feature 'ログイン後、ショッピングカート', type: :feature do
  background do
    @user = build(:user)
    login_as(@user, scope: :user)    
  end

  scenario 'ショッピングカート未追加でショッピングカートを表示すると一覧は表示されない' do
    login_as(@user, scope: :user)
    visit order_items_path
    expect(page).to have_content 'ショッピングカートは空です。'
  end

  scenario '商品詳細ページでカートに追加ボタンが表示されている' do
    flow_click_link_product
    expect(page).to have_button 'カートに追加'
  end

  scenario '商品詳細ページから個数追加でショッピングカート画面に遷移する' do
    flow_click_add_cart
    expect(page).to have_content 'レジに進む'
  end

  scenario 'ショッピングカート画面から商品名選択で商品詳細ページに遷移する' do
    flow_click_add_cart
    click_link 'name0'    
    expect(page).to have_button 'カートに追加'
  end

  scenario 'ショッピングカート画面からレジに進む画面遷移実行' do
    flow_goto_cash_register
    expect(page).to have_content '住所'
  end

  scenario 'お届先情報入力画面から配送情報入力画面へ遷移' do
    flow_goto_delivery
    expect(page).to have_content '配送日時'
  end

  scenario '配送情報入力画面から確認画面へ遷移' do
    flow_goto_confirm
    expect(page).to have_content '住所'
  end

  scenario '確認画面では商品詳細のリンクが表示されていない' do
    flow_goto_confirm
    expect(page).to have_no_link 'name0'
  end

  scenario '確認画面から完了画面へ遷移' do
    flow_goto_confirm
    click_on 'ご購入'    
    expect(page).to have_content 'ご購入頂きありがとうございました。'
  end

  def flow_goto_confirm
    flow_goto_delivery
    dt = (Date.today + 5).strftime('%Y-%m-%d')
    fill_in '配送日', with: dt
    click_on '次へ'
  end

  def flow_goto_delivery
    flow_goto_cash_register
    fill_in '郵便番号', with: '123456'
    fill_in '都道府県', with: '都道府県'
    fill_in '市区町村', with: '市区町村'
    fill_in '氏名(姓)', with: '氏名(姓)'
    fill_in '氏名(名)', with: '氏名(名)'
    click_on '次へ'
  end

  def flow_goto_cash_register
    flow_click_add_cart
    click_on 'レジに進む'        
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