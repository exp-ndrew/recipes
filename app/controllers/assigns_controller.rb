class AssignsController < ApplicationController
  def tag_to_item
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag])
    @recipe.tags << @tag
    flash[:notice] = "Tag #{@tag.name} assigned to #{@recipe.name}."
    redirect_to("/recipes/#{@recipe.id}")
  end
end
