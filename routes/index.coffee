Essay = require('../schemas/schemas').EssayGrades
#
# * GET home page.
#
authorName = ""
authorToken = ""



exports.index = (req, res) ->
  Essay.find (err, items) ->
    console.log("Calling findAllEssays")
    items
    itemAuthor = []
    i = 0
    while i < items.length
      itemAuthor[i] = items[i].Author
      i++

    console.log itemAuthor

  res.render "index",
    title: "Lightside"
    author: res.author
    token:  ""


  return