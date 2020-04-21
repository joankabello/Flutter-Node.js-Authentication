var express = require('express');
var connection = require('./config/database.js');
var app = express();

app.use(function(req, res, next) {
  req.connection = connection
  next()
})

app.use(express.urlencoded());

const authRouter = require("./routes/routes");

app.use("/", authRouter);

let port = process.env.PORT || 3000;
app.listen(port, function () {
  return console.log("Started user authentication server listening on port " + port);
});
