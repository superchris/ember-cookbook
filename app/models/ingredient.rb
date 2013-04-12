class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :name
end
