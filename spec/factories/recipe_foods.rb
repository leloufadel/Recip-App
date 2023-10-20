FactoryBot.define do
  factory :recipe_food do
    quantity { 1 }
    association :recipe, factory: :recipe
    association :food, factory: :food
  end
end
