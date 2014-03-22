class window.preBuiltView extends Backbone.View
  tagName: 'div'
  template: _.template $('#prebuilt-template').html()

  events:
    "click button.submit": "submit"

  initialize: ->
    @render()


  render: ->

    @$el.html @template()

  submit: ->
    demoText = $("#essayText").val()
    authorName = $("#name").val()
    prompt = $("#prompt").val()
