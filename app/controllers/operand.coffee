`import Em from 'ember'`

MyController = Em.Controller.extend
  numTypes: ["random","fixed","ordered"]
  isFixed: Em.computed.equal "model.numType", "fixed"
  isOrdered: Em.computed.equal "model.numType", "ordered"

`export default MyController`