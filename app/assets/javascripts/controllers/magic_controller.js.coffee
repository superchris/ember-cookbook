window.Magic = Ember.Namespace.create()

Magic.EditableTableCell = Ember.Table.TableCell.extend
  classNames: 'editable-table-cell'
  templateName: 'editable_table_cell'
  isEditing:  no
  type:       'text'

  startEditing: (model) ->
    @set 'isEditing', yes if model == @get("rowContent")

  didInsertElement: ->
    @get("controller").on "edit", @, @startEditing

  willDestroyElement: ->
    @get("controller").off "edit", @, @startEditing

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

Magic.EditableTableController = Ember.Table.TableController.extend Ember.Evented,
  hasHeader: yes
  hasFooter: no
  # numFixedColumns: 0
  numRows: 5
  rowHeight: 30

  columns: Ember.computed ->
    columns= []
    return unless @get("content")
    for attrName, meta of @get("content.type").metaData()
      do (attrName) ->
        columns.push Ember.Table.ColumnDefinition.create
          headerCellName: attrName
          contentPath: attrName
          tableCellViewClass: 'Magic.EditableTableCell'
          setCellContent: (row, value) -> row.set(attrName, value)
    columns
  .property("content")

  add: ->
    modelClass = @get("content.type")
    # this groady hack is because calling createRecord() does not make the model
    # appear in the list
    defaultValues = {}
    for attr, meta of modelClass.metaData()
      defaultValues[attr] = meta.options.defaultValue
    model = modelClass.createRecord defaultValues
    Ember.run.schedule "afterRender", => @trigger("edit", model)

  finishedEditing: ->
    @store.commit()
