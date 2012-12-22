EmberCookbook.EditRecipeView = Ember.View.extend
  templateName: 'edit_recipe'
  tagName: "form"

  submit: (event)->
    event.preventDefault()
    @get("controller").saveRecipe()