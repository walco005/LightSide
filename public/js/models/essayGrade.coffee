class window.essayGrade extends Backbone.Model
  urlRoot: '/essaygrade'
  idAttribute: '_id' #conforming to mongodb id syntax
  initialize: ->
    console.log 'Initializing a EssayGrade'

  defaults:
    Grader: 'Trial'
    Author: 'Trial'
    Grades: []
    EssayTexts: []