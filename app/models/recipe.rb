class Recipe < ActiveRecord::Base

  validates_presence_of :title

  attr_accessible :description, :title
end
