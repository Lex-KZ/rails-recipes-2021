class AddNotNullableToRecipeNameDifficulty < ActiveRecord::Migration[6.1]
  def up
    change_column_null(:recipes, :name, false)
    change_column_null(:recipes, :difficulty, false)
  end

  def down
    change_column_null(:recipes, :name, true)
    change_column_null(:recipes, :difficulty, true)
  end
end
