require 'spec_helper'
require 'rails_helper'

feature '商品マスタ' do
  scenario '管理者権限でログインしていない場合、商品一覧ページに遷移不可能である' do
    user = User.where.not(email: 'admin@admin.com').first
    login_as(user)
    expect{ visit admin_products_path }.to raise_error(UncaughtThrowError)
  end

  scenario '管理者権限でログインしている場合、商品一覧ページに遷移可能である' do
    admin = User.where(email: 'admin@admin.com').first
    login_as(admin)
    visit admin_products_path
    expect(page).to have_content '商品一覧'
  end

  scenario '管理者権限でログインしている場合、商品を新規追加可能である' do
    admin = User.where(email: 'admin@admin.com').first
    login_as(admin)
    visit admin_products_path
    click_on "新規追加"
    expect(page).to have_content '新規作成'
  end

  scenario '管理者権限でログインしている場合、商品を編集可能である' do
    admin = User.where(email: 'admin@admin.com').first
    login_as(admin)
    visit admin_products_path
    click_on "name0"
    expect(page).to have_content '更新'
  end
end