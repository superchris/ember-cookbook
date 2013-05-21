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

Cookbook.EditableTableCell = Ember.Table.TableCell.extend
  classNames: 'editable-table-cell'
  templateName: 'editable_table_cell'
  isEditing:  no
  type:       'text'

  innerTextField: Ember.TextField.extend
    typeBinding:  'parentView.type'
    valueBinding: 'parentView.cellContent'
    didInsertElement: -> @$().focus()
    focusOut: (event) ->
      @set 'parentView.isEditing', no

  onRowContentDidChange: Ember.observer ->
    @set 'isEditing', no
  , 'rowContent'

  click: (event) ->
    @set 'isEditing', yes
    event.stopPropagation()

  keyDown: (event) ->
    if event.keyCode == 13
      @set 'isEditing', no
      @get("controller").finishedEditing()


Cookbook.RecipesIndexController = Ember.Table.TableController.extend
  hasHeader: yes
  hasFooter: no
  # numFixedColumns: 0
  numRows: 5
  rowHeight: 30

  # onSelection: ( ->
  #   @transitionToRoute("recipe", @get("selection.firstObject"))
  # ).observes("selection.firstObject")

  columns: Ember.computed ->
    columns= []
    @get("modelClass").eachComputedProperty (attrName, meta) ->
      if meta.isAttribute
        columns.push Ember.Table.ColumnDefinition.create
          headerCellName: attrName
          contentPath: attrName
          tableCellViewClass: 'Cookbook.EditableTableCell'
          setCellContent: (row, value) -> row.set(attrName, value)

    columns
  .property("modelClass")

  modelClass: ( ->
    if @get("content.firstObject") then @get("content.firstObject").constructor else DS.Model
  ).property("content.firstObject")

  add: ->
    recipe = @get("modelClass").createRecord
      title: ""

  finishedEditing: ->
    @store.commit()

Cookbook.RecipeController = Ember.ObjectController.extend
  addIngredient: ->
    @get('model.ingredients').createRecord(name: "New Ingredient")

Cookbook.ApplicationRoute = Ember.Route.extend
  events:
    flash: (level, message) ->
      @controllerFor('application').set('flash', level: level, message: message)