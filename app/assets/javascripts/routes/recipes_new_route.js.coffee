Cookbook.RecipesNewRoute = Ember.Route.extend
  model: ->
    Cookbook.Recipe.createRecord()