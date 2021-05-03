class Recipe < ApplicationRecord
    belongs_to :user
    # has_many :ingredient_recipes
    # has_many :ingredients, through: :ingredient_recipes
    has_and_belongs_to_many :ingredients
end
