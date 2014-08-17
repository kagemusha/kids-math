`import Em from 'ember'`

Obj = Em.Component.extend
  classNameBindings: [":rectangles"]
  onInsert: (->
    elem = @get('element')
    elemWidth = Em.$(elem).width()
    height = Em.$(elem).height()
    partCount = @get('partCount')
    partWidth = elemWidth/partCount
    svgContainer = d3.select(elem).append("svg")
                                      .attr("width", "100%")
                                      .attr("height", "100%")
    partData = [0..partCount]
    selectedColor = @get('selectedColor')
    svgContainer.selectAll("rect")
    .data(partData)
    .enter()
    .append("rect")
    .attr("x", (d,i) ->  i * partWidth )
    .attr("y", 0)
    .attr("width", partWidth)
    .attr("height", "100%")
    .style("fill", (d,i)=> if @selectPart(i) then selectedColor else 'lightgray')
    .style("stroke", 'black')
    .style("stroke-width", 1)
  ).on("didInsertElement")
  selectPart: (i) ->
    i in @get('selectedParts')
  selectedParts: (->
    selectedCount = @get('selectedCount') - 1 || 0
    [0..selectedCount]
  ).property("selectedCount")

`export default Obj`