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

  delete: ->
    @get("model").deleteRecord()
    @store.commit()
    @get("model").on "didDelete", =>
      @transitionToRoute "recipe", @get("model")
