require('lib/setup')

Spine = require('spine')

class App extends Spine.Controller
  constructor: ->
    super
    
    # TODO: Move to appropriate place
    map = L.mapbox.map('map', 'examples.map-4l7djmvo').setView([40, -74.50], 9)

module.exports = App
    