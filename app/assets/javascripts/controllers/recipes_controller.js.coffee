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
      @transitionToRoute "recipes.index"
      @send("flash", "success", "Recipe Deleted")


Cookbook.RecipesController = Ember.ArrayController.extend()

Cookbook.RecipesIndexController = Magic.EditableTableController.extend()

Cookbook.RecipeController = Ember.ObjectController.extend
  addIngredient: ->
    @get('model.ingredients').createRecord(name: "New Ingredient")

Cookbook.ApplicationRoute = Ember.Route.extend
  events:
    flash: (level, message) ->
      @controllerFor('application').set('flash', level: level, message: message)