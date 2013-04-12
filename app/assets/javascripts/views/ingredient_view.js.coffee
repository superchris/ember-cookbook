Cookbook.IngredientView = Ember.View.extend
  templateName: "ingredient"

  click: (event) ->
    @set "controller.isEditing", true

  submit: (event) ->
    debugger
    event.preventDefault()
    @get("controller").saveIngredient()

