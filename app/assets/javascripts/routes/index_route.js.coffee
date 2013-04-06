Cookbook.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'recipes'