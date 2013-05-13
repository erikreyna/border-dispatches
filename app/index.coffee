require('lib/setup')
Spine = require('spine')

Locations = require('lib/locations')


class App extends Spine.Controller
  
  elements:
    '.content'  : 'content'
  
  
  constructor: ->
    super
    
    
    # Initialize map with Stamen layer
    # TODO: Find better tile set
    layer = new MM.StamenTileLayer("terrain")
    @map = new MM.Map("map", layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    setTimeout ( =>
      @content.addClass('hide')
      @goToAliJegk()
    ), 2000
    
  
  goToAliJegk: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.816022, lon: -112.554245 }))
      .zoom(11).optimal(0.9, 1.42, =>
        @content.removeClass('hide')
        @goToNogales()
      )
      
  goToNogales: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.329812, lon: -110.964274 }))
      .zoom(11).optimal(0.9, 1.42, =>
        @goToSierraVista()
      )
  
  goToSierraVista: ->
    easey().map(@map)
      .to(@map.locationCoordinate({ lat: 31.335091, lon: -110.181112 }))
      .zoom(11).optimal()

module.exports = App
    