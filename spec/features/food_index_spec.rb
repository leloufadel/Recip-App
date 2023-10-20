require 'rails_helper'

RSpec.describe 'Food management', type: :feature do
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

  it 'allows a user to create a food' do
    visit new_food_path

    fill_in 'food[name]', with: 'Apple'
    fill_in 'food[measurement_unit]', with: 'Grams'
    fill_in 'food[price]', with: 10
    click_button 'Add New Food'
    sleep(1)
    expect(page).to have_text('Food was successfully created.')
  end

  it 'shows a list of added foods' do
    visit new_food_path

    fill_in 'food[name]', with: 'Apple'
    fill_in 'food[measurement_unit]', with: 'Grams'
    fill_in 'food[price]', with: 10
    click_button 'Add New Food'
    sleep(1)
    expect(page).to have_text('Food was successfully created.')
    visit foods_path
    expect(page).to have_text('Apple')
  end
end
