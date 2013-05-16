
{Controller} = require('spine')

Locations = require 'lib/locations'


class Home extends Controller
  el: $('body')
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  
  formats: ['m4v', 'webm']
  
  elements:
    '.target-area'    : 'targetArea'
    '.primary-video'  : 'primaryVideoEl'
  
  sourceTemplate: require 'views/primary_video'
  
  video:
    'ali-jegk': 0
    'nogales': 1
    'sierra-vista': 2
  
  
  constructor: ->
    super
    
    # Setup routes
    @routes
      "/video/:id": (params) ->
        
        index = @video[params.id]
        @goToLocation(index)
    #
    # Present full screen trailer when page loads
    #
    
    # Set up Popcorn instance
    @primaryVideo = Popcorn(".primary-video")
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
    
    # Set up map for pre-caching
    @preloadMap = new MM.Map("map")
    @preloadMap.addLayer(layer)
    @preloadMap.setCenterZoom(new MM.Location(32.58, -117.07), 11)
    
    # # Send preload map to frequent locations
    # @goToLocation(0, null, null, @preloadMap)
    # @goToLocation(1, null, null, @preloadMap)
    # @goToLocation(2, null, null, @preloadMap)
    
    # Set up visible map
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
        
        loc = new MM.Location(coords.lat, coords.lon)
        if @map.extent().containsLocation(loc)
          console.log location.name
          @swapVideo(location)
        
        # # Get coordinates of location
        # 
        # # Tecate Coordinates
        # 
        # # lat:32.5811734
        # # lon: -116.6209871
        # 
        # lat = coords.lat
        # lon = coords.lon
        # # console.log 'lon', minLon, maxLon
        # # console.log 'lat', minLat, maxLat
        # 
        # if lat < minLat
        #   continue
        # if lat > maxLat
        #   continue
        # if lon < minLon
        #   continue
        # if lon > maxLon
        #   continue
        # 
        # console.log location
        # break
    )
    
  goToLocation: (index, v, rho, map) =>
    
    v   = v or 0.9
    rho = rho or 1.42
    map = map or @map
    
    # Select from Locations array
    location = Locations[index]
    
    console.log "You're going to #{location.name}"
    console.log "Source for videos at", @getSource(location.name)
    
    @primaryVideo.pause()
    
    # Ease over to the new location
    easey().map(map)
      .to(map.locationCoordinate(location.coords))
      .zoom(11).optimal(v, rho, =>
        @swapVideo(location)
      )
  
  getSource: (name) ->
    name = name.replace(' ', '-').toLowerCase()
    sources = []
    for format in @formats
      sources.push "#{name}.#{format}"
    return sources
  
  swapVideo: (location) =>
    return unless location.video
    
    name = location.name
    return if name is @currentLocation
    
    @currentLocation = name
    @primaryVideoEl.empty()
    @primaryVideoEl.html @sourceTemplate( @getSource(name) )
    setTimeout ( =>
      @primaryVideo.play()
    ), 400 

module.exports = Home
