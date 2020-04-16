var express = require('express');
var connection = require('./config/database.js');
var app = express();

connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  connection.query("CREATE DATABASE IF NOT EXISTS division5", function (err, result) {
    if (err) throw err;
    console.log("Database created");
  });
});

app.use(function(req, res, next) {
  req.connection = connection
  next()
})

const authRouter = require("./routes/routes");

app.use("/", authRouter);

let port = process.env.PORT || 3000;
app.listen(port, function () {
  return console.log("Started user authentication server listening on port " + port);
});
