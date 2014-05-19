IndexRoute = Ember.Route.extend

  setupController: (controller, model, queryParams) ->
    @controllerFor('operation').generateEquation()

`export default IndexRoute`
