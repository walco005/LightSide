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
   designator: "B",

  (error, response, body) ->
   console.log body
   return
 request.end


#  # This is an async file read
#  fs.readFile "LinkedList.js", "utf-8", (err, data) ->
#    if err
#
#      # If this were just a small part of the application, you would
#      # want to handle this differently, maybe throwing an exception
#      # for the caller to handle. Since the file is absolutely essential
#      # to the program's functionality, we're going to exit with a fatal
#      # error instead.
#      console.log "FATAL An error occurred trying to read in the file: " + err
#      process.exit -2
#
#    # Make sure there's data before we post it
#    if data
#      PostCode data
#    else
#      console.log "No data to post"
#      process.exit -1
#    return


#exports.preBuilt2 = (req, res) ->
#  data =
#    designator: "unique-designator-12345"
#
#  headers =
#    Authorization: "Token 66d825a8733bbe1e48821e32c4849081f711f89b"
#    "Content-Type": "application/json"
#
#  r = req.post("https://try-api.lightsidelabs.com/api/authors/", data = json.dumps(data), headers = headers)