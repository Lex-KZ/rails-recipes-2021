json.extract! recipe, :id, :name, :difficulty, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
