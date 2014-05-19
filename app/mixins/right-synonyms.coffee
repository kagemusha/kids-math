Mixin = Ember.Mixin.create
  rightSynonyms: ['Right','Yes','Correct']
  right: ->
    index = Math.floor((Math.random()*@get('rightSynonyms.length')));
    console.log(index)
    @get('rightSynonyms').objectAt index
`export default Mixin`
