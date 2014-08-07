`import Em from 'ember'`
`import Math from "kids-math/helpers/math"`
`import RightSynonyms from "kids-math/mixins/right-synonyms"`

Controller = Em.Controller.extend RightSynonyms,
  isAnsweredState: false
  min: 0
  max: 10
  num1Array: [0..10]
  num2Array: [0..10]
  operand1: 5
  operand2: 5
  resetNums: ->
    min = @get 'min'
    max = @get 'max'
    @set "operand1", Math.randomInt min, max
    @set "operand2", Math.randomInt min, max
  operandChanged: (->
    @set "isAnsweredState", false
    @set "isCorrectState", false
    console.log "anstate: #{@get "isAnsweredState"}"
  ).observes("operand1","operand2")
  showAll: false
  operation: (x, y) -> x+y
  operationText: "+"
  equationText: (->
    "#{@get "operand1"} + #{@get "operand2"} = "
  ).property("operand1", "operand2", "operation")
  correctAnswer: (->
    @operation(@get("operand1"), @get("operand2"))
    ).property("operand1", "operand2", "operation")
  answers: (->
    correctAnswer = @get('correctAnswer')
    if correctAnswer == 2 * @get('max')
      startNum = correctAnswer-2
    else if correctAnswer == @get('min')
      startNum = correctAnswer
    else
      startNum = correctAnswer-1
    answers = [startNum, startNum + 1, startNum + 2]
    while answers.length < 6
      rand = Math.randomInt 0, 20
      answers.push(rand) if answers.indexOf(rand) == -1
    _.shuffle answers
  ).property("correctAnswer")
  correctlyAnswered: false
  buttonText: (-> if @get("showAll") then "Hide numbers" else "Show numbers").property("showAll")
  actions:
    verifyAnswer: (answer)->
      @set 'isAnsweredState', true
      return if @get('isCorrectState')
      @set('answer', answer)
      correct = @get('correctAnswer')
      if (0+answer == correct)
        @set 'message', "#{@right()}!  #{@get('equationText')} #{@get('answer')}"
        @set 'isCorrectState', true
      else
        @set('isCorrectState', false)
        highLow = if (0+answer > correct) then "high" else "low"
        @set('message', "#{answer} is too #{highLow}!")

    operationSelected: (operation) -> @set "operation", operation
    showAll: ->
      console.log("show all")
      @set "showAll", not @get("showAll")


`export default Controller`