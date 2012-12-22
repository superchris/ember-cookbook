EmberCookbook.EditRecipeController = Ember.ObjectController.extend

  beginEdit: ->
    @transaction = @get("store").transaction()
    # if @get("content.id")
    @transaction.add(@get("content"))
    # else
      # @set "content", @transaction.createRecord EmberCookbook.Recipe, {}

  successfulSave: (->
    if @get('content.isSaving')
      @set('wasSaving', true)
    else if @get('wasSaving') and @get("content.isValid")
      @set('wasSaving', false)
      EmberCookbook.router.send 'showRecipe'
  ).observes("content.isSaving")

  saveRecipe: ->
    # @get("content.store").commit()
    @transaction.commit()
    # @transaction = null
    #EmberCookbook.router.transitionTo 'recipes.recipe.index', @get("content")

