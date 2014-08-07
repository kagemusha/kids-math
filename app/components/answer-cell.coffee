`import Em from 'ember'`

Obj = Em.Component.extend
  inserted: (->
    Em.$(@get "element").addClass('animated flash');

  ).on("didInsertElement")
  tagName: "td"
  classNames: "answer-cell"
  classNameBindings: ["selected"]
  revealed: Em.computed.alias("table.isCorrectState")
  operand1: Em.computed.alias("table.operand1")
  operand2: Em.computed.alias("table.operand2")
  operation: Em.computed.oneWay("table.operation")
  showAll: Em.computed.alias("table.showAll")
  display: Em.computed.alias("table.isCorrectState")
  displayed: Em.computed.or("showAll","display")
  questionMark: "?"
  displayText: (->
    if @get("selected") and not @get("revealed")
      @get("questionMark")
    else if @get("displayed")
      @get("answer")
  ).property("selected", "displayed", "revealed")
  selected: (->
    @get("xNum")==@get("operand1") and @get("yNum")==@get("operand2")
  ).property("operand1", "operand2", "operation")
  calcEquation: (->
    @get("operation")(@get "xNum", @get "yNum")
  ).property("xNum", "yNum")
  answer: (->
    x = @get "xNum"
    y = @get "yNum"
    @get("operation")(x, y)
  ).property("xNum","yNum")

`export default Obj`