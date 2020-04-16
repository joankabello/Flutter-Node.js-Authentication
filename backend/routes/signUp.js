module.exports = function(app, connection, crypto, express){
    app.post('/signup', express.urlencoded(), function (req, res) {
        var password = crypto.createHash('sha256').update(req.body.password).digest('hex');
        connection.query("SELECT * FROM users WHERE username = ?", [req.body.username], function (err, row) {
          if (row != undefined && row.length) {
            console.log(err);
            res.status(409);
            res.send("An user with that username already exists");
          } else {
            connection.query("CREATE TABLE IF NOT EXISTS division5.users(id int(0), username varchar(255) not null, password varchar(255)not null)");
            var values = [[req.body.username, password]];
            connection.query("INSERT INTO division5.users (username, password) VALUES ?", [values], function (err, result) {
              if (err) throw err;
            });
            res.status(201);
            res.send("Success");
          }
        });
      });
};