class CreateRating < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
    end
  end
end
