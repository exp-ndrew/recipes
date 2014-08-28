class AlterRatings < ActiveRecord::Migration
  def change
    rename_column :ratings, :rating, :stars
  end
end
