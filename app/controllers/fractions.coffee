`import Em from 'ember'`

Obj = Em.Controller.extend
  denominator: 5
  numerator: 2
  selectedColor: "green"

  answeredDenominator: false
  answeredNumerator: false
  denominatorAnswer: null
  numeratorAnswer: null
  denominatorCorrect: false
  numeratorCorrect: false

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
`export default Obj`