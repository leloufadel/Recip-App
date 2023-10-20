require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is valid with a name' do
    user = FactoryBot.build(:user, name: 'John Doe')
    expect(user).to be_valid
  end

  it 'is confirmable through Devise' do
    expect(User.devise_modules).to include(:confirmable)
  end

  it 'is recoverable through Devise' do
    expect(User.devise_modules).to include(:recoverable)
  end

  it 'is registerable through Devise' do
    expect(User.devise_modules).to include(:registerable)
  end

  it 'is rememberable through Devise' do
    expect(User.devise_modules).to include(:rememberable)
  end

  it 'is database_authenticatable through Devise' do
    expect(User.devise_modules).to include(:database_authenticatable)
  end

  it 'is validatable through Devise' do
    expect(User.devise_modules).to include(:validatable)
  end

  it 'has many recipes' do
    user = User.reflect_on_association(:recipes)
    expect(user.macro).to eq(:has_many)
  end
end