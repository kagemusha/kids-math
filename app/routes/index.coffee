`import Em from 'ember'`

IndexRoute = Em.Route.extend

  setupController:  ->
    @controllerFor('operation').generateEquation()

`export default IndexRoute`
