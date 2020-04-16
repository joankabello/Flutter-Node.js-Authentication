module.exports = function (app, connection, crypto, express, jwt, KEY) {
    app.post('/login', express.urlencoded(), function (req, res) {
        console.log(req.body.username + " attempted login");
        var password = crypto.createHash('sha256').update(req.body.password).digest('hex');
        connection.query("SELECT * FROM division5.users WHERE username = ? AND password = ?", [req.body.username, password], function (err, row) {
            if (row != undefined && row.length) {
                var payload = {
                    username: req.body.username,
                };
                var token = jwt.sign(payload, KEY, { algorithm: 'HS256', expiresIn: "15d" });
                console.log("Success");
                res.send(token);
            } else {
                console.error("Failure");
                console.log(err);
                res.status(401)
                res.send("There's no user matching that");
            }
        });
    });
};