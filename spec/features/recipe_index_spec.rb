# spec/features/user_index_spec.rb

require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  scenario 'Asks for login when no users are present' do
    visit root_path

    expect(page).to have_content('You need to sign in or sign up before continuing')

  end

  scenario 'displays a welcome message and featured recipes' do
    visit root_path 
    user = FactoryBot.build(:user)
    # user.confirm
    sign_in user

    expect(page).to have_css('.user-container h1', text: 'Welcome to My Recipe App')
    expect(page).to have_css('.user-container h2', text: 'Featured Recipes')
  end
end
