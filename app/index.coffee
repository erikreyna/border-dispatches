
require 'lib/setup'

{Stack} = require 'spine/lib/manager'
Route   = require 'spine/lib/route'

Home      = require 'controllers/Home'

stack = new Stack
  el: $('body')
  
  controllers:
    home      : Home
  
  routes:
    '/home'       : 'home'
  
  default: 'home'

Route.setup()
module.exports = stack
