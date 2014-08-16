`import Em from 'ember'`
`import EqGenerator from 'kids-math/utils/equation-generator'`

Controller = Em.ObjectController.extend
  init: ->
    equation = EqGenerator.create()
    @set "equation", equation
    equation.generateEquation()
  equation: null
  possiblePoints: 5
  answerRange: [0..20]
  finished: false
  actions:
    verifyAnswer: (answer) ->
      correct = @get('equation.correctAnswer')
      possiblePts = @get('possiblePoints')
      if 0+answer == correct
        @incrementProperty 'score', possiblePts
        @set 'possiblePts', @get 'maxPointsPerQuestion'
        if @get('questionCount') < @get('totalQuestions')
          @incrementProperty 'questionCount'
          @get('equation').generateEquation()
        else
          @set 'finished', true
      else
        @decrementProperty 'possiblePoints'


`export default Controller`