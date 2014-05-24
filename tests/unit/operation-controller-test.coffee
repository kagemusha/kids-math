`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'route:index', "Unit - IndexRoute",
  needs: ['controller:operation', 'controller:settings']
  setup: ->
  teardown: ->

test "generates equation", ->
  expect 2
  opController = @container.lookup("controller:operation")
  ok opController
  opController.generateEquation()
  equal opController.get("nums").length, 2
