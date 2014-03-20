class AppRouter extends Backbone.Router
  routes:
    'demo': 'demo1'

  demo1: ->
    essayGrades = new window.essayCollection()

    $('#prebuilt').html new window.preBuiltView().$el

    return

$(document).ready ->
  app = new AppRouter()
  Backbone.history.start pushState: true