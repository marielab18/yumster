class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :minutes
      t.text :nutritional_info

      t.timestamps
    end
  end
end
