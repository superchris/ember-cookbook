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
    for attrName, meta of @get("contentType").metaData()
      do (attrName) ->
        columns.push Ember.Table.ColumnDefinition.create
          headerCellName: attrName.capitalize()
          contentPath: attrName
          tableCellViewClass: 'Magic.EditableTableCell'
          setCellContent: (row, value) -> row.set(attrName, value)
    columns
  .property("content")

  contentType: Ember.computed ->
    content = @get("content")
    while Ember.ArrayProxy.detectInstance(content) and !DS.RecordArray.detectInstance(content)
      content = content.get "content"
    return content.get("type")
  .property("content")

  add: ->
    model = @get("content.type").createRecord()
    @get("content").addReference(model.get("_reference"))
    Ember.run.schedule "afterRender", => @trigger("edit", model)

  finishedEditing: ->
    @store.commit()
