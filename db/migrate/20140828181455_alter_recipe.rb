class AlterRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :rating_id, :integer
  end
end
