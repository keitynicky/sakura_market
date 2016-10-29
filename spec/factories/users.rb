FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user do
    email "admin@admin.com"
    password "123456"
    password_confirmation "123456"
  end
end