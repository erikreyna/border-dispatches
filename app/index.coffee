require('lib/setup')
Spine = require('spine')


class App extends Spine.Controller
  constructor: ->
    super
    
    layer = new MM.StamenTileLayer("terrain")
    @map = new MM.Map("map", layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    setTimeout ( =>
      @goToAliJegk()
    ), 2000
    
  
  goToAliJegk: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.816022, lon: -112.554245 }))
      .zoom(11).optimal()
    
    setTimeout ( =>
      @goToNogales()
    ), 5000
      
  goToNogales: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.329812, lon: -110.964274 }))
      .zoom(11).optimal()
      
    setTimeout ( =>
      @goToSierraVista()
    ), 5000
    
  goToSierraVista: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.335091, lon: -110.181112 }))
      .zoom(11).optimal()


module.exports = App
    