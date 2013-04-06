class RecipesController < ApplicationController
  respond_to :json, :html

  expose(:recipe)
  expose(:recipes)

  def index
    respond_with(recipes)
  end

  def show
    respond_with(recipe)
  end

  def create
    recipe.save
    respond_with(recipe)
  end

  def update
    recipe.save!
    respond_with(recipe)
  end
end