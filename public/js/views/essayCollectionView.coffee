class window.essayCollectionView extends Backbone.View

  initialize: ->
    @render()

  render: ->
    _.each @collection.models, ((item) ->
      view = new preBuiltView(model: item)
      @$el.append view.$el
      return
    ), this
    this