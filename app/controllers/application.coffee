ApplicationController = Em.Controller.extend
  needs: ['settings']
  kidsNames: Em.computed.alias("controllers.settings.model.kidsNames")
  greeting: (->
    if @get('kidsNames')
      names = @get('kidsNames').split(',')
      greetingArray = for name in names
                        "Hello #{name}!"
      greetingArray.join(" ")
  ).property("kidsNames")

`export default ApplicationController`