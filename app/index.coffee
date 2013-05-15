require('lib/setup')
Spine = require('spine')

Locations = require('lib/locations')


class App extends Spine.Controller
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  
  
  constructor: ->
    super
    window.bd = @
    
    #
    # Present full screen trailer when page loads
    #
    
    # # Set up Popcorn instance
    # primaryVideo    = Popcorn(".primary")
    # 
    # # Set up Popcorn footnotes
    # primaryVideo.code({
    #   start: 32,
    #   onStart: (e) =>
    #     
    #     # Remove initial state of DOM elements
    #     @background.removeClass('initial')
    #     @primary.addClass('small')
    #     @column.addClass('half')
    #     
    #     @goToLocation(0)
    #     
    #     # TODO: Add marker to map
    # })
    # 
    # primaryVideo.code({
    #   start: 65,
    #   onStart: (e) =>
    #     @goToLocation(1, 0.1)
    # })
    # 
    # primaryVideo.code({
    #   start: 114,
    #   onStart: (e) =>
    #     @goToLocation(2, 0.3)
    # })
    # 
    # primaryVideo.play()
    
    # Initialize layer and map
    layer = new MM.TemplatedLayer(@template)
    
    @map = new MM.Map("map")
    @map.addLayer(layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    
  goToLocation: (e, v, rho) =>
    # Get index from data attribute
    index = e.target?.dataset.index or e
    
    v   = v or 0.9
    rho = rho or 1.42
    
    # Select from Locations array
    location = Locations[index]
    
    console.log "You're going to #{location.name}"
    
    # # Update the location metadata
    # @name.text(location.name)
    
    # Ease over to the new location
    easey().map(@map)
      .to(@map.locationCoordinate(location.coords))
      .zoom(11).optimal(v, rho)


module.exports = App
