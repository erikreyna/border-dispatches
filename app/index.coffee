require('lib/setup')
Spine = require('spine')

Locations = require('lib/locations')


class App extends Spine.Controller
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  
  
  elements:
    '.target-area'  : 'targetArea'
  
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
    
    @map = new MM.Map("map", [], null, [new MM.TouchHandler(), new MM.DragHandler()])
    @map.addLayer(layer)
    @map.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    @map.addCallback('panned', (e) =>
      position = @targetArea.position()
      
      top = position.top
      left = position.left
      width = @targetArea.width()
      height = @targetArea.height()
      
      # Create new points
      p1 = new MM.Point(top, left)
      p2 = new MM.Point(top + height, left + width)
      
      l1 = @map.pointLocation(p1)
      l2 = @map.pointLocation(p2)
      
      
      # Cache boundaries
      minLat = l1.lat
      maxLat = l2.lat
      minLon = l1.lon
      maxLon = l2.lon
      
      
      
      # Check if content in region
      for location in Locations
        coords = location.coords
        
        # Get coordinates of location

        # Tecate Coordinates
        
        # lat:32.5811734
        # lon: -116.6209871
        
        lat = coords.lat
        lon = coords.lon
        # console.log 'lon', minLon, maxLon
        # console.log 'lat', minLat, maxLat
        
        if lat < minLat
          continue
        if lat > maxLat
          continue
        if lon < minLon
          continue
        if lon > maxLon
          continue
        
        console.log location
        break
    )
    
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
