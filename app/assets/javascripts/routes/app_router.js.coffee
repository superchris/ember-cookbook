EmberCookbook.Router = Ember.Router.extend
  location: 'hash'

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'

    recipes: Ember.Route.extend
      route: "/recipes"

      showRecipe: Ember.Route.transitionTo('recipes.recipe.index')


      index: Ember.Route.extend
        route: "/"

        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('recipes', router.get("store").findAll(EmberCookbook.Recipe))


      recipe: Ember.Route.extend

        route: "/:recipe_id"

        connectOutlets: (router, ctx) ->
          console.log("outer connect outlets ctx: #{ctx}")
          router.get("applicationController").connectOutlet("recipe", ctx)

        editRecipe: Ember.Route.transitionTo('recipes.recipe.edit')

        index: Ember.Route.extend
          route: "/"

          connectOutlets: (router) ->
            router.get("applicationController").connectOutlet("recipe")

        edit: Ember.Route.extend
          route: "edit"

          connectOutlets: (router, ctx) ->
            router.get("applicationController").connectOutlet("editRecipe", router.get("recipeController").get("content"))
            router.get("editRecipeController").beginEdit()









