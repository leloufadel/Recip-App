# spec/factories/foods.rb
FactoryBot.define do
  factory :food do
    name { 'Sample Food' }
    measurement_unit { 'grams' }
    price { 10 }
    user
  end
end
