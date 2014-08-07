`import Em from 'ember'`

Controller = Em.Controller.extend

  countTo: 100
  countByNums: [1...11]
  numDims: [1..11]
  num1Array: [1..10]
  num2Array: [1..10]
  operation: (x, y) -> 10*(y-1) + x
  countBy: 1
  countTimeout: 1600
  countBtnLbl: (->
    if @get("counting") then "Stop" else "Count"
  ).property("counting")
  num: 0
  count: ->
    countBy = @get("countBy")
    Em.run.later @, (=>
      @set("counting", false) if @get("num") > @get("countTo")
      return if not @get("counting")
      @set "num", @get("num")+countBy
      Em.Logger.debug "counting by #{countBy}: #{@get "num"}"
      @count()
    ), @get("countTimeout")
  canContinue:  (->
    num = @get("num")
    not @get("counting") and num > 0 and num < @get("countTo")
  ).property("counting")

  actions:
    toggleCounting: ->
      if @get("counting")
        @set "counting", false
      else #start counting
        @set "num", 0
        @set "counting", true
        @count()
    continue: ->
      @set "counting", true
      @count()

`export default Controller`