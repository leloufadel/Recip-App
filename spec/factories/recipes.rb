# # spec/factories/recipes.rb
# FactoryBot.define do
#     factory :recipe do
#       name { 'Delicious Recipe' }
#       preparation_time { 30 }
#       cooking_time { 60 }
#       user
#     end
#   end

# spec/factories/recipes.rb

FactoryBot.define do
  factory :recipe do
    name { 'Sample Recipe' }
    description { 'This is a test recipe.' }
    preparation_time { 30 }
    cooking_time { 60 }
    user
  end
end
