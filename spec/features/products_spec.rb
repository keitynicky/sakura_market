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
end