require('lib/setup')
Spine = require('spine')


class App extends Spine.Controller
  constructor: ->
    super
    
    layer = new MM.StamenTileLayer("terrain")
    map = new MM.Map("map", layer)
    map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    setTimeout ( ->
      easey().map(map)
        .to(map.locationCoordinate({ lat: 26.3811, lon: -98.817 }))
        .zoom(11).optimal()
    ), 2000
    

module.exports = App
    