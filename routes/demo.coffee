querystring = require('querystring')
https = require('https')
fs = require('fs')
request = require('request')

exports.demo = (req, res) ->
  res.render "layouts/demo",
    title: "Lightside Demo"

  return

#POSTS AUTHOR
exports.preBuiltRequest = (req, res) ->

 request.post 'https://try-api.lightsidelabs.com/api/authors/',
  headers:
      Authorization: "Token "
      "Content-Type": "application/json"
  form:
   designator: req.body.authorName,

  (error, response, body) ->
    return console.error("upload failed:", error)  if error
    console.log "Upload successful!  Server responded with:", body
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
      title: 'Justin'
      author: mostRecentSubmission.designator
      token:  mostRecentToken

    return
