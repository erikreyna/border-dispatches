
{Controller} = require('spine')

Locations = require 'lib/locations'


class Home extends Controller
  el: $('body')
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  # template: 'http://tile.stamen.com/watercolor/{Z}/{X}/{Y}.png'
  
  formats: ['m4v', 'webm']
  
  elements:
    '.target-area'    : 'targetArea'
    '.primary-video'  : 'primaryVideoEl'
    'video'           : 'videos'
    '.photos'         : 'photos'
    '.description'    : 'description'
    '.navigate'       : 'navigateEl'
  
  
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
    # @primaryVideo = Popcorn(".primary-video")
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
    
    # Set up visible map
    @map = new MM.Map("map", [], null, [new MM.TouchHandler(), new MM.DragHandler(), new MM.DoubleClickHandler()])
    @map.addLayer(layer)
    @map.setCenterZoom(new MM.Location(31.58, -108.07), 6)
    
    @map.addCallback('panned', (e) =>
      return unless @map.getZoom() > 10
      
      # Get position of navigate div
      offset = @navigateEl.offset()
      
      top = offset.top
      left = offset.left
      width = @navigateEl.width()
      height = @navigateEl.height()
      
      # Create new points
      p1 = new MM.Point(top, left)
      p2 = new MM.Point(top + height, left + width)
      
      l1 = @map.pointLocation(p1)
      l2 = @map.pointLocation(p2)
      
      # Create an extent
      extent = new MM.Extent(l1, l2)
      
      # Check for content in region
      for location in Locations
        coords = location.coords
        
        loc = new MM.Location(coords.lat, coords.lon)
        
        if extent.containsLocation(loc)
          @swapVideo(location)
          break
    )
  
  goToLocation: (index, v, rho, map) =>
    
    # Select from Locations array
    location = Locations[index]
    
    # Check if current video
    name = location.name
    
    v   = v or 0.9
    rho = rho or 1.42
    map = map or @map
    
    console.log "You're going to #{location.name}"
    
    # Pause and fade video
    if @currentLocation
      previous = $("video[data-name='#{@dasherize(@currentLocation)}']")
      previous[0].pause()
      previous.removeClass('show')
    
    # Ease over to the new location
    easey().map(map)
      .to(map.locationCoordinate(location.coords))
      .zoom(11).optimal(v, rho, =>
        
        # Hide previous video
        @videos.removeClass('display')
        
        @swapVideo(location)
      )
  
  getSource: (name) ->
    name = @dasherize(name)
    
    sources = []
    for format in @formats
      sources.push "#{name}.#{format}"
    return sources
  
  swapVideo: (location) =>
    return unless location.video
    name = location.name
    return if name is @currentLocation
    
    # Set new current location
    @currentLocation = name
    
    # Add description
    @description.html(location.description)
    @photos.html require('views/photos')({name: @dasherize(name)})
    
    # Fade in and play current video
    current = $("video[data-name='#{@dasherize(@currentLocation)}']")
    console.log current
    current.addClass('display')
    setTimeout ( ->
      current.addClass('show')
      current[0].play()
    ), 0
  
  dasherize: (name) ->
    return name.replace(' ', '-').toLowerCase()

module.exports = Home
