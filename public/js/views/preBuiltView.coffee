class window.preBuiltView extends Backbone.View
  tagName: 'div'
  template: _.template $('#prebuilt-template').html()

  events:
    "onclick button.submit": "submit"

  initialize: ->
    @render()


  render: ->

    @$el.html @template()

  submit: ->

    #insert API call here
    demoText = $("#essayText").val