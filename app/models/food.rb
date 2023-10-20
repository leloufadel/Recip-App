class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :measurement_unit, presence: true, length: { minimum: 1, maximum: 10 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def name_with_measurement_unit
    "#{name} (#{measurement_unit})"
  end
end
