Cookbook.IngredientView = Ember.View.extend
  templateName: "ingredient"

  click: (event) ->
    @set "controller.isEditing", true


Cookbook.TextField = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

  focusOut: ->
    @get("controller").saveIngredient()