class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :preparation_time, presence: true

  validates :cooking_time, presence: true

  validates :description, presence: true
end
