class Recipe < ApplicationRecord
    belongs_to :user
    # has_many :ingredient_recipes
    # has_many :ingredients, through: :ingredient_recipes
    has_and_belongs_to_many :ingredients
    has_many :comments, as: :commentable
    has_one_attached :image
end
