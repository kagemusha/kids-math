`import Em from 'ember'`

POSSIBLE_OPERATIONS = "+-/*"

Obj = Em.Object.extend
  correctAnswer: (->
    eval @get('equationText')
  ).property('equationText')
  pattern: "? ? ?"
  targetedOperations: ["+"]
  lowerBound: 0
  upperBound: 10
  #inclusive since _.random(x) ranges from 0 to x
  expanse: (
    -> @get('upperBound') - @get('lowerBound')
  ).property("lowerBound","upperBound")

  generateEquation: ->
    pattern = @get('pattern').replace(/\s+/g, "")
    equationElems = for token,i in pattern
      if i%2
        @getAnOperation token
      else
        @getANum token
    @set "equationElems", equationElems
  equationText: (->
    @get("equationElems").join(" ")
  ).property("equationElems")
  answer: (->
    eval @get('equationText')
  ).property("equationText")
  #have more strategies later
  #number of answers to show
  answerCount: 5
  answerRange: (->
    answers = [@get "answer"]
    while answers.length < @answerCount
      answer = @randomFromRange()
      answers.push(answer) if answers.indexOf(answer) < 0
    answers
  ).property("answer")

  getAnOperation: (token) ->
    if POSSIBLE_OPERATIONS.indexOf(token) > -1
      token
    else
      operations = this.get('targetedOperations')
      operations[ _.random(operations.length-1)  ]
  getANum: (token) ->
    if Em.typeOf(token) == "number"
      token
    else
      @randomFromRange()
  randomFromRange: ->
    _.random(@get 'expanse' ) + @get('lowerBound')


`export default Obj`
