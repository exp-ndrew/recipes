class AlterRecipesTags < ActiveRecord::Migration
  def change
    remove_column :recipes_tags, :id
  end
end
