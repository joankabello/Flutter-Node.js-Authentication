var crypto = require('crypto');

module.exports = {
    selectLogIn: function (connection, username, password, callback) {
        var cryptPassword = crypto.createHash('sha256').update(password).digest('hex');
        connection.query("SELECT * FROM division5.users WHERE username = ? AND password = ?", [username, cryptPassword], callback);
    },
    selectSignUp: function (connection, username, password, callback) {
        connection.query("SELECT * FROM users WHERE username = ?", [username], callback);
    },
    create: function (connection) {
        connection.query("CREATE TABLE IF NOT EXISTS division5.users(id int(0), username varchar(255) not null, password varchar(255)not null)");
    },
    insert: function (connection, username, password, callback) {
        var cryptPassword = crypto.createHash('sha256').update(password).digest('hex');
        var credentials = [[username, cryptPassword]];
        console.log(credentials);
        connection.query("INSERT INTO division5.users (username, password) VALUES ?", [credentials], callback);
    }
};