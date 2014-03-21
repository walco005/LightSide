
###
Module dependencies.
###
express = require("express")
routes = require("./routes")
user = require("./routes/user")
http = require("http")
path = require("path")
mongoose = require 'mongoose'
demo = require("./routes/demo")
app = express()

#connect to database
# ./mongodb/bin/mongod --dbpath ~/WebstormProjects/testProject2/db/
mongoose.connect 'mongodb://localhost/test'
db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.once 'open', ->
  console.log 'DB connection opened'

#set main layout
app.set 'layout', 'layouts/demo'
#expose templates to all views
app.set 'partials',
  head: 'partials/head',
  scripts: 'partials/scripts'

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.engine "html", require("hogan-express")
app.set "view engine", "html"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use express.static(path.join(__dirname, "public"))
app.use express.static(path.join(__dirname, 'bower_components'))

# development only
app.use express.errorHandler()  if "development" is app.get("env")
app.get "/", routes.index
app.get "/demo", demo.demo
app.get "/users", user.list
app.post "/demo", demo.preBuilt

http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")
return
