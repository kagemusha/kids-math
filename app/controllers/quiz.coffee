`import Em from 'ember'`
`import EqGenerator from 'kids-math/utils/equation-generator'`

Controller = Em.ObjectController.extend
  init: ->
    equationGenerator = EqGenerator.create();
    @set "equationGenerator", equationGenerator
    equationGenerator.generateEquation();
  equationGenerator: null
  actions:
    next: ->
      console.log "next"

`export default Controller`