Cookbook.RecipesRoute = Ember.Route.extend
  model: ->
    Cookbook.Recipe.find()

  # events:
  #   submit: (model)->
  #     @get('store').commit()
  #     # @transitionTo('recipe', model)