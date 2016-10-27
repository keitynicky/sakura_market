require 'spec_helper'

RSpec.feature "トップページ", type: :feature do
  scenario '商品を選択した場合、商品詳細ページに遷移すること' do
    visit root_path
    click_link 'name0'
    expect(page).to have_content "価格："
  end

  scenario 'ログインリンクをクリックした場合、ログイン画面に遷移すること' do
    visit root_path
    click_link 'ログイン'
    expect(page).to have_content "メールアドレス"
  end

  scenario 'さくらマーケットをクリックした場合、トップページに遷移すること' do
    visit root_path
    click_link 'さくらマーケット'
    expect(page).to have_content "name0"
  end

  scenario 'お買い物をクリックした場合、トップページに遷移すること' do
    visit root_path
    click_link 'お買い物'
    expect(page).to have_content "name0"
  end

  scenario '未ログインで、ショッピングカートをクリックした場合、ショッピングカートに遷移すること' do
    visit root_path
    click_link 'ショッピングカート'
    expect(page).to have_content "メールアドレス"
  end
end