
{Controller} = require('spine')

Locations = require 'lib/locations'


class Home extends Controller
  el: $('body')
  
  # Templates for tile layer (take your pick)
  # template: 'http://tile.openstreetmap.org/{Z}/{X}/{Y}.png'
  # template: 'http://tile.stamen.com/terrain/{Z}/{X}/{Y}.png'
  # template: 'http://tile.stamen.com/watercolor/{Z}/{X}/{Y}.png'
  template: 'tiles/{Z}/{X}/{Y}.png'
  
  formats: ['m4v', 'webm']
  
  elements:
    '.target-area'    : 'targetArea'
    '.primary-video'  : 'primaryVideoEl'
    'video'           : 'videos'
    '.photos'         : 'photos'
    '.description'    : 'description'
    '.navigate'       : 'navigateEl'
  
  
  events:
    'click ul li a'   : 'highlightName'
  
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
    
    # Listen for window resize to update variables
    $(window).resize (e) =>
      offset = @navigateEl.offset()
      
      top = offset.top
      left = offset.left
      width = @navigateEl.width()
      height = @navigateEl.height()
      @navigateCorners =
        p1: left
        p2: top
        p3: left + width
        p4: top + height
    $(window).resize()
    
    # hide splash page on click
    $('#splash').click =>
      @fade( $('#splash') )
      $('ul li a').first().click()
      @navigate '/video/ali-jegk'
      $('.flexbox').removeClass('hide')
    
    # Initialize layer and map
    layer = new MM.TemplatedLayer(@template)
    
    # Set up visible map
    @map = new MM.Map("map", [], null, [new MM.TouchHandler(), new MM.DragHandler(), new MM.DoubleClickHandler()])
    @map.addLayer(layer)
    @map.setCenterZoom(new MM.Location(31.58, -108.07), 6)
    
    @plotContent()
    
    @map.addCallback('drawn', (e) =>
      
      # Update marker positions
      for location in Locations
        if location.video
          coords = location.coords
          coordinate = new MM.Location(coords.lat, coords.lon)
          point = @map.locationPoint(coordinate)
          
          marker = $(".marker[data-name='#{@dasherize(location.name)}']")
          marker.css('top', point.y)
          marker.css('left', point.x)
    )
    
    @map.addCallback('panned', (e) =>
      
      return unless @map.getZoom() > 10
      
      # Create new points
      navigateCorners = @navigateCorners
      p1 = new MM.Point(navigateCorners.p1, navigateCorners.p2)
      p2 = new MM.Point(navigateCorners.p3, navigateCorners.p4)
      
      l1 = @map.pointLocation(p1)
      l2 = @map.pointLocation(p2)
      
      extent = new MM.Extent(l1, l2)
      
      # Check for content in region
      for location in Locations
        coords = location.coords
        coordinate = new MM.Location(coords.lat, coords.lon)
        
        if extent.containsLocation(coordinate)
          @swapVideo(location)
          return
      
      $('.col2').removeClass('display').removeClass('show')
      
      # Pause and fade video
      if @currentLocation
        previous = $("video[data-name='#{@dasherize(@currentLocation)}']")
        previous[0].pause()
        previous.removeClass('show')
      
      @currentLocation = null
      
    )
  
  plotContent: ->
    
    for location in Locations
      if location.video
        coords = location.coords
        coordinate = new MM.Location(coords.lat, coords.lon)
        point = @map.locationPoint(coordinate)
        name = @dasherize(location.name)
        marker = $('body').append("<div class='marker' data-name='#{name}' style='left: #{point.x}px; top: #{point.y}px'></div>")
  
  goToLocation: (index, v, rho, map) =>
    
    # Select from Locations array
    location = Locations[index]
    
    # Check if current video
    name = location.name
    
    v   = v or 0.9
    rho = rho or 1.42
    map = map or @map
    
    # Pause and fade video
    if @currentLocation
      previous = $("video[data-name='#{@dasherize(@currentLocation)}']")
      previous[0].pause()
      previous.removeClass('show')
    
    # Offset the location
    coords = location.coords
    tmpCoords = {lat: coords.lat - 0.1, lon: coords.lon - 0.2}
    
    # Ease over to the new location
    easey().map(map)
      .to(map.locationCoordinate(tmpCoords))
      .zoom(11).optimal(v, rho, =>
        @swapVideo(location)
      )
  
  getSource: (name) ->
    name = @dasherize(name)
    
    sources = []
    for format in @formats
      sources.push "#{name}.#{format}"
    return sources
  
  highlightName: (e) =>
    $('ul li a').removeClass('highlight')
    
    el = $(e.target)
    el.addClass('highlight')
  
  swapVideo: (location) =>
    return unless location.video
    name = location.name
    return if name is @currentLocation
    
    @hideVideos()
    
    # Set new current location
    @currentLocation = name
    
    # Add description and photos
    @description.html(location.description)
    @photos.html require('views/photos')({name: @dasherize(name)})
    $('.col2').addClass('display').addClass('show')
    
    # Fade in and play current video
    current = $("video[data-name='#{@dasherize(@currentLocation)}']")
    current.addClass('display')
    setTimeout ( ->
      current.addClass('show')
      current[0].play()
    ), 0
  
  dasherize: (name) ->
    return name.replace(' ', '-').toLowerCase()
  
  # TODO: Make this a fade out function
  fade: (el) ->
    el.addClass('hide')
    # setTimeout ( ->
    #   el.addClass('hide')
    # ), 1000
  
  hideVideos: ->
    @videos.addClass('hide')
    @videos.removeClass('display')

module.exports = Home
