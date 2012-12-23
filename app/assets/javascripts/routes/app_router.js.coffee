EmberCookbook.Router = Ember.Router.extend
  location: 'hash'

  enableLogging: true

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'

    recipes: Ember.Route.extend
      route: "/recipes"

      showRecipe: Ember.Route.transitionTo('recipes.recipe.index')

      showNewRecipe: Ember.Route.transitionTo('recipes.newRecipe')

      index: Ember.Route.extend
        route: "/"

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('recipes', router.get("store").findAll(EmberCookbook.Recipe))

      newRecipe: Ember.Route.extend
        route: "/new"

        connectOutlets: (router, ctx) ->
          router.get("recipesController").connectOutlet("editRecipe", router.get("store").createRecord(EmberCookbook.Recipe))
          router.get("editRecipeController").beginEdit()

      recipe: Ember.Route.extend

        route: "/:recipe_id"

        connectOutlets: (router, ctx) ->
          console.log("outer connect outlets ctx: #{ctx}")
          router.get("recipesController").connectOutlet("recipe", ctx)

        editRecipe: Ember.Route.transitionTo('recipes.recipe.edit')

        index: Ember.Route.extend
          route: "/"

          connectOutlets: (router) ->
            router.get("recipesController").connectOutlet("recipe")

        edit: Ember.Route.extend
          route: "edit"

          connectOutlets: (router, ctx) ->
            router.get("recipesController").connectOutlet("editRecipe", router.get("recipeController").get("content"))
            router.get("editRecipeController").beginEdit()









