Obj =
  randomInt: (min, max) ->
    length = max - min
    Math.floor(Math.random() * length) + min

`export default Obj`