class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |new_table|
      new_table.string :name
      new_table.integer :difficulty

      new_table.timestamps
    end
  end
end
