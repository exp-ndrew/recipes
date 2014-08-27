class CreateRecipesTags < ActiveRecord::Migration
  def change
    create_table :recipes_tags do |t|
      t.integer :tag_id
      t.integer :recipe_id
    end
  end
end
