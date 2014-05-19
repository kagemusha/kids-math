`import AnswerCell from "kids-math/components/answer-cell"`

Obj = AnswerCell.extend

  alreadySelected: false
  displayed: true

  countSelected: (-> @get("currentNum") == @get("answer") ).property("currentNum")
  onSelected: (->
    @set "alreadySelected", true if @get("countSelected")
  ).observes("countSelected")
  onReset: (->
    if @get("currentNum") == 0
      @set "alreadySelected", false
  ).observes("currentNum")

`export default Obj`