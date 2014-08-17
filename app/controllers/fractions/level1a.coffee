`import Em from 'ember'`
`import {randomInt} from 'kids-math/utils/math'`

Obj = Em.Controller.extend
  maxDenominator: 8
  minDenominator: 2
  denominator: 5
  numerator: 2
  selectedColor: "green"
  repititions: 0

  answeredDenominator: false
  answeredNumerator: false
  denominatorAnswer: null
  numeratorAnswer: null
  denominatorCorrect: false
  numeratorCorrect: false
  complete: (->
    @get('repititions') > 1
  ).property("repititions")
  reset: ->
    if @get('complete')
      @transitionToRoute 'fractions.level1b'
    min = @get('minDenominator')
    range = @get('maxDenominator') - min
    denominator = randomInt(range, min)
    @set 'denominator', denominator
    @set 'numerator', randomInt(denominator-1, 1)
    @set('denominatorAnswer', null)
    @set('numeratorAnswer', null)
    @set('denominatorCorrect', false)
    @set('numeratorCorrect', false)
    @set('answeredDenominator', null)
    @set('answeredNumerator', null)
    @incrementProperty 'repititions'

  actions:
    onDenominatorAnswer: (answer) ->
      @set('denominatorAnswer', answer)
      @set('answeredDenominator', true)
      correct = 1*answer == 1*@get('denominator')
      @set('denominatorCorrect', correct)
    onNumeratorAnswer: (answer) ->
      @set('numeratorAnswer', answer)
      @set('answeredNumerator', true)
      correct = 1*@get("numeratorAnswer") == 1*@get('numerator')
      @set('numeratorCorrect', correct)
      if correct
        Em.run.later @, (->
          @reset()
        ), 1000
`export default Obj`