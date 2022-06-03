class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :meal_type
      t.integer :calories
      t.integer :proteins
      t.string :carbohydrates
      t.string :integers
      t.integer :fats

      t.timestamps
    end
  end
end
