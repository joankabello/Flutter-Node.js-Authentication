var express = require('express');
var jwt = require('jsonwebtoken');
var crypto = require('crypto');
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
});
const KEY = "m yincredibl y(!!1!11!)<'SECRET>)Key'!";
var app = express();

connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  connection.query("CREATE DATABASE IF NOT EXISTS division5", function (err, result) {
    if (err) throw err;
    console.log("Database created");
  });
});

require('./routes/index.js')(app, connection, crypto, express, jwt, KEY);

let port = process.env.PORT || 3000;
app.listen(port, function () {
  return console.log("Started user authentication server listening on port " + port);
});
