var crypto = require('crypto');

module.exports = {
    selectLogIn: function (connection, username, password, callback) {
        var cryptPassword = crypto.createHash('sha256').update(password).digest('hex');
        connection.query("SELECT * FROM division5.users WHERE username = ? AND password = ?", [username, cryptPassword], callback);
    },
    selectSignUp: function (connection, username, password, callback) {
        connection.query("SELECT * FROM users WHERE username = ?", [username], callback);
    },
    insert: function (connection, username, password, callback) {
        var cryptPassword = crypto.createHash('sha256').update(password).digest('hex');
        var credentials = [[username, cryptPassword]];
        connection.query("INSERT INTO division5.users (username, password) VALUES ?", [credentials], callback);
    }
};