Cookbook.Recipe = DS.Model.extend Ember.Validations.Mixin,
  title: DS.attr('string')
  validations:
    title:
      presence: true
  description: DS.attr('string')
  ingredients: DS.hasMany('Cookbook.Ingredient')

Cookbook.Ingredient = DS.Model.extend
  name: DS.attr('string')
  recipe: DS.belongsTo('Cookbook.Recipe')
