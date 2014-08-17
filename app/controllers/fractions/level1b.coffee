`import Em from 'ember'`
`import {randomInt} from 'kids-math/utils/math'`

Obj = Em.Controller.extend
  maxDenominator: 8
  minDenominator: 2
  denominator: 5
  numerator: 2
  selectedColor: "green"

  answered: false
  denominatorAnswer: null
  numeratorAnswer: null
  answerCorrect: false

  reset: ->
    min = @get('minDenominator')
    range = @get('maxDenominator') - min
    denominator = randomInt(range, min)
    @set 'denominator', denominator
    @set 'numerator', randomInt(denominator-1, 1)
    @set('denominatorAnswer', null)
    @set('numeratorAnswer', null)
    @set('answerCorrect', false)
    @set('answered', null)

  actions:
    onAnswer: (answer) ->
      #todo
      @set('numeratorAnswer', answer)
      @set('answeredNumerator', true)
      correct = 1*@get("numeratorAnswer") == 1*@get('numerator')
      @set('numeratorCorrect', correct)
      if correct
        Em.run.later @, (->
          @reset()
        ), 1000
`export default Obj`