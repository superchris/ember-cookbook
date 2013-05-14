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

Cookbook.RecipesIndexController = Ember.Table.TableController.extend
  hasHeader: yes
  hasFooter: no
  numFixedColumns: 0
  numRows: 500000
  rowHeight: 30

  columns: Ember.computed ->
    columns= []
    @get("modelClass").eachComputedProperty (attrName, meta) ->
      if meta.isAttribute
        columns.push Ember.Table.ColumnDefinition.create
          columnWidth: 100
          headerCellName: attrName
          contentPath: attrName

    columns
  .property("modelClass")

  modelClass: Ember.computed ->
    if @get("content.firstObject") then @get("content.firstObject").constructor else DS.Model
  .property("content.firstObject")

Cookbook.RecipeController = Ember.ObjectController.extend
  addIngredient: ->
    @get('model.ingredients').createRecord(name: "New Ingredient")

Cookbook.ApplicationRoute = Ember.Route.extend
  events:
    flash: (level, message) ->
      @controllerFor('application').set('flash', level: level, message: message)