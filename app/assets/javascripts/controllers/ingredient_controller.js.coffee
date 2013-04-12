Cookbook.IngredientController = Ember.ObjectController.extend
  init: ->
    @_super()
    console.log("Hey im in ingredient controller, yo!")
  saveIngredient: ->
    @get("store").commit()
    @set("isEditing", false)

Cookbook.register('controller:ingredient', Cookbook.IngredientController, {singleton: false });