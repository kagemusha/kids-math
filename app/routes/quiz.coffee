`import Em from 'ember'`
`import Quiz from "../models/quiz"`

MyRoute = Em.Route.extend
  model: ->
    Quiz.create()

`export default MyRoute`
