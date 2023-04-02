const express = require('express');
const { login, Me, register, logOut } = require('../controllers/Auth');

const router = express.Router();

router.get('/me', Me);
router.post('/login', login);
router.post('/register', register);
router.delete('/logout', logOut);

module.exports = router;