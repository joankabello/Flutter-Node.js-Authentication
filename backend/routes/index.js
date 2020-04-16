module.exports = function (app, connection, crypto, express, jwt, KEY) {
    require('./signUp.js')(app, connection, crypto, express);
    require('./logIn.js')(app, connection, crypto, express, jwt, KEY);
    require('./home.js')(app, jwt, KEY);
};
