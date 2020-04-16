const express = require("express");
const router = express.Router();
const authController = require("../controller/authController");

router.post('/login', express.urlencoded(), authController.login);
router.get('/data', authController.home);
router.post('/signup', express.urlencoded(), authController.signup);

module.exports = router;