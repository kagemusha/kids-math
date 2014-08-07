`import Em from 'ember'`

Obj = Em.Object.extend
  rangeBottom: 1
  rangeTop: 10
  numType: "random"
  fixedVal: 1
  stepBy: 1
  currentVal: 1
  nextInOrder: ->
    val = @get('currentVal') + @get('stepBy')
    val = @get('rangeBottom') if val > @get('rangeTop')
    @set "currentVal", val
    val

  numRange: (-> [@get('rangeBottom')..@get('rangeTop')]).property('rangeBottom', 'rangeTop')


`export default Obj`
