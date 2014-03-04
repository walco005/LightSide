// Generated by CoffeeScript 1.7.1

/*
Module dependencies.
 */

(function() {
  var app, db, express, http, mongoose, path, routes, user;

  express = require("express");

  routes = require("./routes");

  user = require("./routes/user");

  http = require("http");

  path = require("path");

  mongoose = require('mongoose');

  app = express();

  mongoose.connect('mongodb://localhost/test');

  db = mongoose.connection;

  db.on('error', console.error.bind(console, 'connection error:'));

  db.once('open', function() {
    return console.log('DB connection opened');
  });

  app.set("port", process.env.PORT || 3000);

  app.set("views", path.join(__dirname, "views"));

  app.engine("html", require("hogan-express"));

  app.set("view engine", "html");

  app.use(express.favicon());

  app.use(express.logger("dev"));

  app.use(express.json());

  app.use(express.urlencoded());

  app.use(express.methodOverride());

  app.use(app.router);

  app.use(express["static"](path.join(__dirname, "public")));

  if ("development" === app.get("env")) {
    app.use(express.errorHandler());
  }

  app.get("/", routes.index);

  app.get("/users", user.list);

  http.createServer(app).listen(app.get("port"), function() {
    return console.log("Express server listening on port " + app.get("port"));
  });

  return;

}).call(this);

//# sourceMappingURL=app.map