`import Em from 'ember'`

Controller = Em.ObjectController.extend
  actions:
    next: ->
      console.log "next"

`export default Controller`