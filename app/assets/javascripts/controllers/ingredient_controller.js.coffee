Cookbook.IngredientController = Ember.ObjectController.extend
  init: ->
    @_super()
    console.log("Hey im in ingredient controller, yo!")

  saveIngredient: ->
    @get("store").commit()
    @set("isEditing", false)

  editing: (->
    @get("isNew") || @get("isEditing")
  ).property('isNew', 'isEditing')

Cookbook.register('controller:ingredient', Cookbook.IngredientController, {singleton: false });