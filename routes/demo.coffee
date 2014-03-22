querystring = require('querystring')
https = require('https')
fs = require('fs')
request = require('request')

exports.demo = (req, res) ->
  res.render "layouts/demo",
    title: "Lightside Demo"

  return

exports.preBuiltRequest = (req, res) ->
#  options =
#    url: "https://try-api.lightsidelabs.com/api/authors/"
#    method: "post"
#    headers:
#      Authorization: "Token "
#      "Content-Type": "application/json"
#
#  data = designator: "test name"
#
#  request options, data, (error, response, body) ->
#    console.log body
#    return


 request.post 'https://try-api.lightsidelabs.com/api/authors/',
  headers:
      Authorization: "Token "
      "Content-Type": "application/json"
  form:
   designator: req.body.name,

  (error, response, body) ->
    return console.error("upload failed:", error)  if error
    console.log "Upload successful!  Server responded with:", body
    return
