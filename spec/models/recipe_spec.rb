require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'has a valid factory' do
    recipe = FactoryBot.build(:recipe)
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = FactoryBot.build(:recipe, name: nil)
    expect(recipe).to_not be_valid
  end

  it 'belongs to a user' do
    user_association = Recipe.reflect_on_association(:user)
    expect(user_association.macro).to eq(:belongs_to)
  end

  it 'has many recipe_foods' do
    recipe = Recipe.reflect_on_association(:recipe_foods)
    expect(recipe.macro).to eq(:has_many)
  end
end
