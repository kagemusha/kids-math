`import Operand from "kids-math/models/operand"`

SettingsController = Em.ObjectController.extend
  kidsNames: ""
  isShowingSettings: false
  isHidingSettings: Em.computed.not('isShowingSettings')
  levels: [1,2]
  level: 1
  operands: [Operand.create({name: "Num 1"}), Operand.create({name: "Num 2"})]
  numTypes: Operand.NUM_TYPES
  actions:
    showSettings: -> @set 'isShowingSettings', true
    close: -> @set 'isShowingSettings', false

`export default SettingsController`