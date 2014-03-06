class AppRouter extends Backbone.Router
  routes:
    '': 'demo'

  demo: ->

    $('#prebuilt').html new window.preBuiltView().$el

app = new AppRouter()
Backbone.history.start pushState: true