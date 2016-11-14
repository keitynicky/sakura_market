require 'spec_helper'
require 'rails_helper'

feature 'ログインとログアウト' do
  background do
    User.create(email: 'foo@example.com', password: '123456')
  end
  scenario 'ログインする' do
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'foo@example.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
    expect(page).to have_content 'ログアウト'
  end

  scenario 'ログアウトする' do
    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'foo@example.com'
    fill_in 'パスワード', with: '123456'
    click_button 'ログイン'
    click_link 'ログアウト'    
    expect(page).to have_content 'ログイン'
  end
end

feature 'ユーザーマスタ' do
  scenario '管理者権限でログインしていない場合、ユーザー一覧ページに遷移不可能である' do
    user = User.where.not(email: 'admin@admin.com').first
    login_as(user)
    expect{ visit admin_users_path }.to raise_error(UncaughtThrowError)
  end

  scenario '管理者権限でログインしている場合、ユーザー一覧ページに遷移可能である' do
    admin = User.where(email: 'admin@admin.com').first
    login_as(admin)
    visit admin_users_path
    expect(page).to have_content 'ユーザー一覧'
  end
end