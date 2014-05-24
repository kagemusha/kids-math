`import { test, moduleFor } from 'ember-qunit'`
`import startApp from '../helpers/start-app'`

app = null

moduleFor 'route:index', "Acceptance - IndexRoute",
  needs: ['controller:operation', 'controller:settings']
  setup: ->
    app = startApp()
  teardown: ->
    Ember.run(app, 'destroy')

test "equation appears correctly", ->
  opController = app.__container__.lookup("controller:operation")
  visit('/').then ->
    ok find("ul#menu").length, "The menu should show up"
    ok find("#equation"), "Should have an equation"
    equal find("#equation").text().replace(/[\s]/g, ""), "#{opController.get("nums").join("+")}=?"

test "Correct answer gets correct message", ->
  opController = app.__container__.lookup("controller:operation")
  visit('/').then ->
    answer = eval opController.get("equationText")
    correctBtn = find("button:contains('#{answer}')")
    click(correctBtn ).then ->
      ok find("div:contains('Go again')").length, "Correct answer should be recognized"

test "Incorrect answer gets incorrect message", ->
  opController = app.__container__.lookup("controller:operation")
  visit('/').then ->
    answer = eval opController.get("equationText")
    wrongAnswer = answer += (if (answer == opController.get("upperBound")) then - 1 else 1)
    inCorrectBtn = find("button:contains('#{wrongAnswer}')")
    click(inCorrectBtn ).then ->
      ok find("div:contains('Try again')").length, "Incorrect answer should be recognized"
