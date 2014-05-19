Export = Em.Component.extend
  tagName: "span"
  #classNameBindings: ["correctlySelected"]
  correctlySelected: Em.computed.and("isCorrect","clicked")
  wasCorrectlyAnswered: Em.computed.alias("table.isCorrectState")
  clicked: false
  isCorrect: (-> @get('num') == @get('answer')).property('num', 'answer')
  isDisappeared: (->
    return true if @get("clicked") and not @get('isCorrect')
    return true if @get('wasCorrectlyAnswered') and not @get('isCorrect')
    return false
  ).property("clicked","isCorrect",'wasCorrectlyAnswered')
  click: ->
    @sendAction 'action', @get('num')
    @set "clicked", true

`export default Export`
