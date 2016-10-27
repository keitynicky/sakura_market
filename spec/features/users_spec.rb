require 'spec_helper'

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