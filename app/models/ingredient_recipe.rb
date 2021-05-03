class IngredientRecipe < ApplicationRecord
  self.table_name = "ingredients_recipes"
  belongs_to :ingredient
  belongs_to :recipe
end
