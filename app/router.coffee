`import Em from 'ember'`

Router = Em.Router.extend
  location: KidsMathENV.locationType

Router.map ->
  @route "operation-table"
  @route "count-by"
  @route "quiz"
  @resource "fractions", ->
    @route "level1a"
    @route "level1b"


`export default Router`
