`import Em from 'ember'`

Router = Em.Router.extend
  location: KidsMathENV.locationType

Router.map ->
  @route "operation-table"
  @route "count-by"
  @route "quiz"
  @route "fractions"

`export default Router`
