Cookbook.Router.map ->
  @resource 'about'
  @resource 'recipes', ->
    @resource 'recipe', path: ':recipe_id', ->
    @route 'edit', path: ':recipe_id/edit'
    @route 'new'