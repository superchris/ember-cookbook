DS.Model.reopenClass
  metaData: ->
    metaData = {}
    @eachComputedProperty (attrName, meta) ->
      metaData[attrName] = meta if meta.isAttribute
    metaData

  defaultValues: ->
    defaultValues = {}
    metaData = @metaData()
    for attr, meta of metaData
      defaultValues[attr] = meta.options.defaultValue
    defaultValues


Cookbook.Recipe = DS.Model.extend Ember.Validations.Mixin,
  title: DS.attr('string', defaultValue: "")
  validations:
    title:
      presence: true
  description: DS.attr('string')
  ingredients: DS.hasMany('Cookbook.Ingredient')

Cookbook.Ingredient = DS.Model.extend
  name: DS.attr('string')
  recipe: DS.belongsTo('Cookbook.Recipe')
