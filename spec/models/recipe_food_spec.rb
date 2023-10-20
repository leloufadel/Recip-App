require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'has a valid factory' do
    recipe_food = FactoryBot.build(:recipe_food)
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food = FactoryBot.build(:recipe_food, quantity: nil)
    expect(recipe_food).to_not be_valid
  end

  it 'requires quantity to be a non-negative integer' do
    recipe_food = FactoryBot.build(:recipe_food, quantity: -1)
    expect(recipe_food).to_not be_valid

    recipe_food = FactoryBot.build(:recipe_food, quantity: 5) # Adjust the value as needed
    expect(recipe_food).to be_valid
  end

  it 'belongs to a recipe' do
    recipe_association = RecipeFood.reflect_on_association(:recipe)
    expect(recipe_association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    food_association = RecipeFood.reflect_on_association(:food)
    expect(food_association.macro).to eq(:belongs_to)
  end
end
