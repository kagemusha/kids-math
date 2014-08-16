`import { test, moduleFor } from 'ember-qunit'`
`import EqGenerator from 'kids-math/utils/equation-generator'`

moduleFor 'route:index', "Unit - IndexRoute",
  needs: ['controller:operation', 'controller:settings']
  setup: ->
  teardown: ->

test "generates equation", ->
  expect 1
  generator = EqGenerator.create();
  equation = generator.generateEquation()
  equal equation.equationText[1], "+"
