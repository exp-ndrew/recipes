class FixRatings < ActiveRecord::Migration
  def change
    remove_column :recipes, :rating_id
    create_table :ratings_recipes, :id => false do |t|
      t.column :rating_id, :int
      t.column :recipe_id, :int
    end
  end
end
