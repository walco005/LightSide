Essay = require('../schemas/schemas').EssayGrades

# Populate the database if there are no records
Essay.count({},(err, c) ->
  console.log err if err
  if c == 0
    console.log 'Populating database'
    populateDB()
)


exports.findAllEssays = (req, res) ->
  Essay.find (err, items) ->
    console.log("Calling findAllEssays")
    res.send items

exports.create = (req, res) ->
  newEssayGrade = new Essay req.body
  console.log 'created essay grade for ' + newEssayGrade.Author
  newEssayGrade.save()
  res.send()

exports.getByAuthor = (req, res) ->
  id = req.route.params['Author']
  Essay.findById id, (err, result) ->
    res.send result

populateDB = ->
  EssaysArray = [
    {
       Grader: 'Justin'
       Author: 'David'
       Grades: ['A']
       EssayTexts: ['My Essay Sucks']
    }
  ]

  createAndAdd Essays for Essays in EssaysArray


createAndAdd = (sec)->
  newEssays = new Essay(sec)
  newEssays.save()