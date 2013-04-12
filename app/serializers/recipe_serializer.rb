class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  embed :ids, include: true

  has_many :ingredients
end
