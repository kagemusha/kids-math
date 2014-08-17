`import Em from 'ember'`

Obj = Em.Route.extend
#  setupController: (controller, model, queryParams)->
#    @_super(controller, model, queryParams)
#    console.log "myroute"
  actions:
    becomeWizard: (answer) ->
      @transitionTo "fractions.level1a"

`export default Obj`
