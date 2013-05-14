class IngredientsController < ApplicationController
  respond_to :json, :html

  expose(:ingredient)
  expose(:ingredients)

  def index
    respond_with(ingredients)
  end

  def show
    respond_with(ingredient)
  end

  def create
    ingredient.save
    respond_with(ingredient)
  end

  def update
    ingredient.save!
    respond_with(ingredient)
  end

  def destroy
    ingredient.destroy
    respond_with {}
  end

end