class AssignsController < ApplicationController

  def tag_to_recipe
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag])
    @recipe.tags << @tag
    flash[:notice] = "This recipe was tagged #{@tag.name}."
    redirect_to("/recipes/#{@recipe.id}")
  end

  def tag_from_recipe
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag_id])
    @recipe.tags.delete(@tag)
    flash[:notice] = "The tag #{@tag.name} was removed."
    redirect_to("/recipes/#{@recipe.id}")
  end

  def recipe_from_tag
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:id])
    @tag.recipes.delete(@recipe)
    flash[:notice] = "The recipe for '#{@recipe.name}' was removed."
    redirect_to("/tags/#{@tag.id}")
  end

end
