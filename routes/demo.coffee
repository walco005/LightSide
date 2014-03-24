querystring = require('querystring')
https = require('https')
fs = require('fs')
request = require('request')

exports.demo = (req, res) ->

  options =
    url: "https://try-api.lightsidelabs.com/api/prompts/6"
    method: "get"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
  request options,(error, response, body) ->
    defaultPrompt= JSON.parse(body).text
    console.log defaultPrompt
    res.render "layouts/demo",
      title: "Lightside Demo"
      prompt: defaultPrompt
    return

exports.authorPost = (req, res) ->
  authorList = []
  options =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      designator: 'David'

  request options,(error, response, body) ->
    console.log body
    authorList.push JSON.parse(body).designator
    console.log authorList
    res.render "index",
      title: ''
      author: ""
      token:  ""
    return

#POSTS ANSWER SET
exports.answerSetPost = (req, res) ->
#  options =
#    url: "https://try-api.lightsidelabs.com/api/answer-sets/"
#    method: "post"
#    headers:
#      Authorization: "Token "
#      "Content-Type": "application/json"
#    form:
#      prompt: "https://try-api.lightsidelabs.com/api/prompts/6",
#      trained_models: []

  request options,(error, response, body) ->
#    mostRecentSubmission = JSON.parse(body).results[0]
#    mostRecentToken = mostRecentSubmission.auth_token
    console.log body
  #    console.log mostRecentToken

  res.render "index",
    title: ''
    author: ""
    token:  ""

#POSTS ANSWER
exports.answerPost = (req, res) ->

  options =
    url: "https://try-api.lightsidelabs.com/api/answers/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      author: "https://try-api.lightsidelabs.com/api/authors/29",
      answer_set: "https://try-api.lightsidelabs.com/api/answer-sets/76",
      text: "This is another answer in answer set 76."

  request options,(error, response, body) ->
    res.render "index",
      title: ''
      author: ""
      token:  ""
    return

#POSTS ANSWER
exports.submitEssay = (req, res) ->
  author = req.body.authorName
  authorURL= ''
  authorIndex = 0
  authorList = []
  authorListURL = []
  essayText = req.body.essayText
  console.log 'this is ' + essayText

  optionsCreateAuthor =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      designator: req.body.authorName

  optionsGetAuthors =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "get"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"

  optionsPostAnswer =
    url: "https://try-api.lightsidelabs.com/api/answers/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      author: authorURL,
      answer_set: "https://try-api.lightsidelabs.com/api/answer-sets/76",
      text: essayText

  optionsPostAnswerSet =
    url: "https://try-api.lightsidelabs.com/api/answer-sets/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      prompt: "https://try-api.lightsidelabs.com/api/prompts/6",
      trained_models: []

  request optionsPostAnswerSet, (error, response, body) ->
   console.log body

  request optionsGetAuthors, (error, response, body) ->
    i = 0
    while i < JSON.parse(body).results.length
      authorList[i] = JSON.parse(body).results[i].designator
      authorListURL[i] = JSON.parse(body).results[i].url
      i++
  if not author in authorList
    request optionsCreateAuthor, (error, response, body) ->
      console.log 'hello'
      console.log body
      authorList.push JSON.parse(body).designator
      authorListURL.push JSON.parse(body).url
    authorIndex = authorList.indexOf(author)
    authorURL = authorListURL[authorIndex]
  else
    authorIndex = authorList.indexOf(author)
    authorURL = authorListURL[authorIndex]

  optionsPostAnswer =
     url: "https://try-api.lightsidelabs.com/api/answers/"
     method: "post"
     headers:
       Authorization: "Token "
       "Content-Type": "application/json"
     form:
       author: authorURL,
       answer_set: "https://try-api.lightsidelabs.com/api/answer-sets/76",
       text: essayText

  request optionsPostAnswer, (error, response, body) ->
    console.log 'POSTANSWER'
    console.log body
    res.render "index",
      title: 'Submission Complete'
      author: author
      text: essayText
  return



#DELETES AUTHORS
exports.deleteAuthor = (req, res) ->

  request.del 'https://try-api.lightsidelabs.com/api/authors/',
  headers:
    Authorization: "Token "
    "Content-Type": "application/json"

  (error, response, body) ->
    return console.error("upload failed:", error)  if error
    console.log "Upload successful!  Server responded with:", body
    return



#GET CURRENT STATE OF AUTHORS
exports.getRequest = (req, res) ->
  authorList = []
  options =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "get"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
  request options,(error, response, body) ->
    i = 0
    while i < JSON.parse(body).results.length
      authorList[i] = JSON.parse(body).results[i].designator
      i++
    console.log authorList.indexOf(';;;')
    mostRecentSubmission = JSON.parse(body).results[0]
    mostRecentToken = mostRecentSubmission.auth_token
#    console.log mostRecentSubmission
#    console.log mostRecentToken
    res.render "ireq.body.authorNamendex",
      title: 'HEY'
      author: mostRecentSubmission.designator
    return


exports.postAnswerSet = (req,res) ->
  optionsPostAnswerSet =
    url: "https://try-api.lightsidelabs.com/api/answer-sets/"
    method: "get"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
#    form:
#      prompt: "https://try-api.lightsidelabs.com/api/prompts/6",
#      trained_models: []

  request optionsPostAnswerSet, (error, response, body) ->
    console.log JSON.parse(body)


#makeAPIOption = (optionName, url, method, forms...) ->
#  i = 0
#  optionName =
#    url: "https://try-api.lightsidelabs.com/api/" + url
#    method: method
#    headers:
#      Authorization: "Token "
#      "Content-Type": "application/json"
#    form:
#      forms
#
#console.log makeAPIOption('option1', 'authors', 'post', prompt: "https://try-api.lightsidelabs.com/api/prompts/6", trained_models: [] )