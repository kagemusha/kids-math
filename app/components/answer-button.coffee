AnswerButtonComponent = Em.Component.extend
  tagName: "span"
  isCorrect: (-> @get('num') == @get('answer')).property('num', 'answer')
  isDisappeared: (->
      @get("isAnsweredState") and not @get('isCorrect')
    ).property("isAnsweredState","isCorrect")
  click: ->
    @sendAction 'action', @get('num')


`export default AnswerButtonComponent`
