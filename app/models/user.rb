class User < ApplicationRecord
  has_many :foods
  has_many :recipes

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end
