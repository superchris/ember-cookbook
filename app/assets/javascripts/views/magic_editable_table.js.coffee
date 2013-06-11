#= require ../controllers/magic_controller

Magic.EditableTableContainer = Ember.Table.TablesContainer.extend Ember.Table.RowSelectionMixin,
  selectionBinding: 'controller.selection'

Magic.EditableTable = Ember.View.extend
  classNames: "presentation-container"
  template: Ember.Handlebars.compile ( '{{view Magic.EditableTableContainer}}')

Ember.Handlebars.registerHelper 'magic_editable_table', (path, options) ->
  unless options
    options = path
    path = "controller"
  content = Ember.Handlebars.get(@, path, options)
  if Magic.EditableTableController.detectInstance content
    controller = content
  else
    controller = Magic.EditableTableController.create content: content
  options.hash.controller = controller
  Ember.Handlebars.helpers.view.call(@, Magic.EditableTable, options)