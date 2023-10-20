# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
    confirmed_at { Time.current }
  end
end
