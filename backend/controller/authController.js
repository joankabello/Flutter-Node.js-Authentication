const Auth = require("../model/auth");
require("dotenv").config();
const KEY = process.env.DEV_KEY;
var jwt = require('jsonwebtoken');

module.exports = {
    login: function (req, res) {
        Auth.selectLogIn(req.connection, req.body.username, req.body.password, function (err, row) {
            if (row != undefined && row.length) {
                var payload = {
                    username: req.body.username,
                };
                var token = jwt.sign(payload, KEY, { algorithm: 'HS256', expiresIn: "15d" });
                res.send(token);
            } else {
                res.status(401)
                res.send("There's no user matching that");
            }
        })
    },

    home: function (req, res) {
        var str = req.get('Authorization');
        try {
            jwt.verify(str, KEY, { algorithm: 'HS256' });
            res.send("Welcome");
        } catch {
            res.status(401);
            res.send("Bad Token");
        }
    },

    signup: function(req, res) {
        Auth.selectSignUp(req.connection, req.body.username, req.body.password, function (err, row) {
            if (row != undefined && row.length) {
                res.status(409);
                res.send("An user with that username already exists");
              } else {
                Auth.create(req.connection);
                Auth.insert(req.connection, req.body.username, req.body.password, function (err, result) {
                  if (err) throw err;
                });
                res.status(201);
                res.send("Success");
              }
    
        });
    }
};