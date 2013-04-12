Cookbook.RecipesNewController = Ember.ObjectController.extend
  submit: ->
    @store.commit()
    @get("model").on "didCreate", =>
      @transitionToRoute "recipe", @get("model")

Cookbook.RecipesEditController = Ember.ObjectController.extend
  submit: ->
    @store.commit()
    @get("model").on "didUpdate", =>
      @transitionToRoute "recipe", @get("model")
