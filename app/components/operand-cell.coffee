`import Em from 'ember'`

Obj = Em.Component.extend
  tagName: "td"
  classNames: ["operand"]
  classNameBindings: ["selected"]
  selected: (->
    @get("operand") == @get("num")
  ).property("operand","num")
  #selected: ().property("operand","num")
  #classNames: "answer-cell"
  click: ->
    console.log "selected num: #{@get('num')}"
    @set "operand", @get('num')

`export default Obj`