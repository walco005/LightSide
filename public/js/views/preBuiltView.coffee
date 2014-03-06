class window.preBuiltView extends Backbone.View
  tagName: 'div'
  template: _.template $('prebuilt-template').html()

  initialize: ->
    @render()

  render: ->
    @$el.html @template()