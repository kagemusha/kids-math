`import Em from 'ember'`

MyRoute = Em.Route.extend

  setupController: (controller)->
    controller.resetNums();

`export default MyRoute`
