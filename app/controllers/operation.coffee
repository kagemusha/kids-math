`import Em from 'ember'`
`import RightSynonyms from "kids-math/mixins/right-synonyms"`

Controller = Em.Controller.extend RightSynonyms,
  needs: ['settings']
  operands: Em.computed.alias("controllers.settings.operands")
  isAnsweredState: false
  isCorrectState: false
  correctAnswer: (->
    eval @get('equationText')
  ).property('equationText')
  nums: []
  level: Em.computed.alias('controllers.settings.level')
  level2Question: (->
    @get('level')==2 and !@get('isAnsweredState')
  ).property('level', 'isAnsweredState')

  num1: (->
    @get('nums').objectAt(0))
  .property('nums')
  num2: (-> @get('nums').objectAt(1)).property('nums')

  num1Array: (->  @_numArray(@get 'num1')).property('num1')
  num2Array: (->  @_numArray(@get 'num2')).property('num2')
  operation: '+'
  showOperationInVisualization: (-> @get('num1') and @get('num2')).property('num1', 'num2')
  lowerBound: 0
  upperBound: 6
  expanse: (-> @get('upperBound') - @get('lowerBound')).property("lowerBound","upperBound")
  answer: null
  answerArray: (-> @_numArray(@get 'answer') ).property('answer')
  answerRange: (->
    [@get('lowerBound')..2*(@get('expanse')-1)]
  ).property("lowerBound", "upperBound", "expanse")
  equationText: (->
    num1 = @get('nums').objectAt(0)
    num2 = @get('nums').objectAt(1)
    "#{num1}#{@get('operation')}#{num2}"
  ).property("num1", "num2", "operation")
  genInt: (operand)->
    numType = operand.get('numType')
    return operand.get('fixedVal') if numType=="fixed"
    return operand.nextInOrder() if numType=="ordered"
    Math.floor(Math.random() * @get('expanse')) + @get('lowerBound')
  generateEquation: ->
    @set 'nums', [ @genInt(@get('operands').objectAt(0)), @genInt(@get('operands').objectAt(1))]
  _numArray: (num, start=0) ->
    return [] if num <= start
    [start+1..num+start]
  message: "I'm a msg"
  buttonLabel: (->
    if @get('isCorrectState')
      "Go again"
    else
      "Try again"
  ).property('isCorrectState')
  rightSynonyms: ['Right','Yes','Correct']
  right: ->
    index = Math.floor((Math.random()*@get('rightSynonyms.length')));
    console.log(index)
    @get('rightSynonyms').objectAt index
  actions:
    verifyAnswer: (answer)->
      return if @get('isAnsweredState')
      @set('answer', answer)
      @set('isAnsweredState', true)
      correct = @get('correctAnswer')
      if (0+answer == correct)
        @set 'message', "#{@right()}!!  #{@get('equationText')} = #{@get('answer')}"
        @set 'isCorrectState', true
      else
        @set('isCorrectState', false)
        if (0+answer > correct)
          @set('message', "Too high!")
        else
          @set('message', "Too low!")
    reset: ->
      @generateEquation() if @get('isCorrectState')
      @set('isAnsweredState', false)
    #end actions

`export default Controller`