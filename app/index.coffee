require('lib/setup')
Spine = require('spine')

Locations = require('lib/locations')


class App extends Spine.Controller
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  
  elements:
    '.content'    : 'content'
    'nav'         : 'nav'
    '.name'       : 'name'
    '.primary'    : 'primary'
    '.secondary'  : 'secondary'
  
  
  events:
    'click .loc-nav li' : 'goToLocation'
  
  
  constructor: ->
    super
    
    #
    # Present full screen trailer when page loads
    #
    
    # Set up Popcorn instance
    primaryVideo    = Popcorn(".primary")
    secondaryVideo  = Popcorn(".secondary")
    
    # Set up Popcorn footnotes
    primaryVideo.code({
      start: 5,
      onStart: (e) =>
        # Resize video
        @primary.width(480)
        @primary.height(320)
        @goToLocation(0)
    })
    
    primaryVideo.code({
      start: 10,
      onStart: (e) =>
        @goToLocation(1)
    })
    
    primaryVideo.code({
      start: 15,
      onStart: (e) =>
        @goToLocation(2)
    })
    
    primaryVideo.play()
    
    
    # Initialize layer and map
    layer = new MM.TemplatedLayer(@template)
    
    @map = new MM.Map("map")
    @map.addLayer(layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    # TODO: Create controller and view for location navigation
    @locNav = @el.find('.loc-nav')
    @locNav.html require('views/location-navigation')(Locations)

  goToLocation: (e) =>
    # Get index from data attribute
    index = e.target?.dataset.index or e
    
    # Select from Locations array
    location = Locations[index]
    
    @nav.removeClass('hide')
    
    # Update the location metadata
    @name.text(location.name)
    
    # Ease over to the new location
    easey().map(@map)
      .to(@map.locationCoordinate(location.coords))
      .zoom(11).optimal(0.9, 1.42)


module.exports = App
