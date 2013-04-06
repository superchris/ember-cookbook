#= require ./models

Cookbook.Recipe.FIXTURES = [{
    id: 1
    title: "Pancakes"
    description: "Tall and fluffy"
    ingredients: [1, 2, 3]
  }, {
    id: 2
    title: "Waffles"
    description: "Tried and true"
    ingredients: [2, 4]
  }, {
    id: 3
    title: "Eggs"
    description: "Any way you like"
    ingredients: [3]
}]

Cookbook.Ingredient.FIXTURES = [{
    id: 1
    title: "Sugar"
  }, {
    id: 2
    title: "Flour"
  }, {
    id: 3
    title: "Cheese"
  }, {
    id: 4
    title: "Water"
}]

