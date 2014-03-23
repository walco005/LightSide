querystring = require('querystring')
https = require('https')
fs = require('fs')
request = require('request')

exports.demo = (req, res) ->
  res.render "layouts/demo",
    title: "Lightside Demo"
  return

#POSTS AUTHOR
exports.authorPost = (req, res) ->
  options =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      designator: req.body.authorName

  request options,(error, response, body) ->
    console.log body
    res.render "index",
      title: ''
      author: ""
      token:  ""
    return

#POSTS ANSWER SET
exports.answerSetPost = (req, res) ->
  options =
    url: "https://try-api.lightsidelabs.com/api/answer-sets/"
    method: "post"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
      prompt: "https://try-api.lightsidelabs.com/api/prompts/82",
      trained_models: []

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
    console.log body
    res.render "index",
      title: ''
      author: ""
      token:  ""
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
  options =
    url: "https://try-api.lightsidelabs.com/api/authors/"
    method: "get"
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
  request options,(error, response, body) ->
    mostRecentSubmission = JSON.parse(body).results[0]
    mostRecentToken = mostRecentSubmission.auth_token
    console.log mostRecentSubmission
    console.log mostRecentToken
    res.render "index",
      title: ''
      author: mostRecentSubmission.designator
      token:  mostRecentToken
    return

createAuthor= (req, res) ->
  request.post 'https://try-api.lightsidelabs.com/api/authors/',
    headers:
      Authorization: "Token "
      "Content-Type": "application/json"
    form:
     designator: req.body.authorName,

  (error, response, body) ->
    return console.error("upload failed:", error)  if error
    console.log "Upload successful!  Server responded with:", body
    console.log response.url
    return
  request.end


