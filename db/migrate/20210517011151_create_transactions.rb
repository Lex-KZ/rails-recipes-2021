class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :seller, null: false
      t.references :buyer, null: false
      t.references :recipe, null: false, foreign_key: true
      t.integer :amount, default: 0
      t.timestamps
    end
  end
end
