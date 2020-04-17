const express = require("express");
const router = express.Router();
const authController = require("../controller/authController");

router.post('/login', authController.login);
router.get('/data', authController.home);
router.post('/signup', authController.signup);

module.exports = router;