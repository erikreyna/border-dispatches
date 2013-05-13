require('lib/setup')
Spine = require('spine')

Locations = require('lib/locations')


class App extends Spine.Controller
  
  elements:
    '.content'  : 'content'
    'nav'       : 'nav'
  
  events:
    'click .loc-nav li' : 'goToLocation'
  
  
  constructor: ->
    super
    
    
    # Initialize map with Stamen layer
    # TODO: Find better tile set
    layer = new MM.StamenTileLayer("terrain")
    @map = new MM.Map("map", layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    # TODO: Create controller and view for location navigation
    @locNav = @el.find('.loc-nav')
    @locNav.html require('views/location-navigation')(Locations)

  goToLocation: (e) =>
    # Get index from data attribute
    index = e.target.dataset.index
    
    # Select from Locations array
    location = Locations[index]
    
    @nav.removeClass('hide')
    
    # Ease over to the new location
    easey().map(@map)
      .to(@map.locationCoordinate(location.coords))
      .zoom(11).optimal(0.9, 1.42)


module.exports = App
