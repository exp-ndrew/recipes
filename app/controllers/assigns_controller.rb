class AssignsController < ApplicationController

  def tag_to_recipe
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag])
    @recipe.tags << @tag
    flash[:notice] = "This recipe was tagged #{@tag.name}."
    redirect_to("/recipes/#{@recipe.id}")
  end

end
