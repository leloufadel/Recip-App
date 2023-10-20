require 'rails_helper'

RSpec.describe 'Recipe management', type: :feature do
  before(:each) do
    DatabaseCleaner.clean
  end
  before(:each) do
    user = FactoryBot.create(:user)
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'password123'
    click_button 'Log in'
    sleep(1)
  end

  it 'allows a user to create a recipe' do
    visit new_recipe_path

    fill_in 'recipe[name]', with: 'Apple Pie'
    fill_in 'recipe[preparation_time]', with: 2
    fill_in 'recipe[cooking_time]', with: 2
    fill_in 'recipe[description]', with: 'Pie with apples'

    within('form') do
      click_button 'Add New Recipe'
    end

    sleep(1)
    expect(page).to have_text('Recipe was successfully created.')
    expect(page).to have_text('Apple Pie')
  end

  it 'allows a user to remove a recipe' do
    visit new_recipe_path

    fill_in 'recipe[name]', with: 'Apple Pie'
    fill_in 'recipe[preparation_time]', with: 2
    fill_in 'recipe[cooking_time]', with: 2
    fill_in 'recipe[description]', with: 'Pie with apples'

    within('form') do
      click_button 'Add New Recipe'
    end

    visit recipes_path
    sleep(0.05)
    expect(page).to have_text('Apple Pie')

    within('form') do
      click_button 'Delete'
    end
    expect(page).not_to have_text('Apple Pie')
  end

  it 'allows user to add food to a Recipe' do
    visit new_food_path

    fill_in 'food[name]', with: 'Apple'
    fill_in 'food[measurement_unit]', with: 'Grams'
    fill_in 'food[price]', with: 10
    click_button 'Add New Food'
    sleep(1)
    expect(page).to have_text('Food was successfully created.')

    visit new_recipe_path

    fill_in 'recipe[name]', with: 'Apple Pie'
    fill_in 'recipe[preparation_time]', with: 2
    fill_in 'recipe[cooking_time]', with: 2
    fill_in 'recipe[description]', with: 'Pie with apples'

    within('form') do
      click_button 'Add New Recipe'
    end

    sleep(1)
    expect(page).to have_text('Recipe was successfully created.')
    expect(page).to have_text('Apple Pie')

    visit recipes_path

    click_link 'Apple Pie'
    sleep(1)
    click_link 'Add Ingredient'
    select Food.first.name, from: 'recipe_food[food_id]'

    fill_in 'recipe_food[quantity]', with: 5

    within('form') do
      click_button 'Add New Ingredient'
    end

    sleep(1)
    expect(page).to have_text('Added new ingredient')
  end
end
