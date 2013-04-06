Cookbook.Recipe = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  ingredients: DS.hasMany('Cookbook.Ingredient')

Cookbook.Ingredient = DS.Model.extend
  title: DS.attr('string')
  recipes: DS.hasMany('Cookbook.Recipe')