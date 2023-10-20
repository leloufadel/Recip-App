require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'has a valid factory' do
    food = FactoryBot.build(:food)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = FactoryBot.build(:food, name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid with a name less than 3 characters' do
    food = FactoryBot.build(:food, name: 'ab')
    expect(food).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    food = FactoryBot.build(:food, name: 'a' * 51)
    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    food = FactoryBot.build(:food, measurement_unit: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid with a measurement unit longer than 10 characters' do
    food = FactoryBot.build(:food, measurement_unit: 'a' * 11)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = FactoryBot.build(:food, price: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid with a non-integer price' do
    food = FactoryBot.build(:food, price: 12.34)
    expect(food).to_not be_valid
  end

  it 'is not valid with a price less than or equal to 0' do
    food = FactoryBot.build(:food, price: 0)
    expect(food).to_not be_valid

    food = FactoryBot.build(:food, price: -5)
    expect(food).to_not be_valid
  end
end
