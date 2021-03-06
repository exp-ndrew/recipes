class RecipesController < ApplicationController
  def index
    @recipes = Recipe.sorted_by_rating
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Your recipe was added."
      redirect_to('/recipes')
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @tags = Tag.all
    @rating = Rating.all
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect_to("/recipes/#{@recipe.id}")
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "#{@recipe.name} was removed."
    redirect_to('/recipes')
  end
end
