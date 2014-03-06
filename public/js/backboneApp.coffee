class AppRouter extends Backbone.Router
  routes:
    'demo': 'demo1'

  demo1: ->
    $('#prebuilt').html new window.preBuiltView().$el


$(document).ready ->
  app = new AppRouter()
  Backbone.history.start pushState: true