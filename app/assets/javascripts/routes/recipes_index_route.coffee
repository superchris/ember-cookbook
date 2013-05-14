Cookbook.RecipesIndexRoute = Ember.Route.extend

  model: ->
    Cookbook.Recipe.find()