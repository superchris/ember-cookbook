class Recipe < ActiveRecord::Base

  has_many :ingredients

  validates_uniqueness_of :title

  attr_accessible :description, :title
end
