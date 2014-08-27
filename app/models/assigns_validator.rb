# class AssignsValidator < ActiveModel::Validator
#   def validate(record)
#     if recipe.tags.exists?({:recipe_id => record.recipe_id}) &&
#       recipe.tags.exists?({:tag_id => record.tag_id})

#       record.errors[:base] << "It's a miracle!"
#     end
#   end
# end
