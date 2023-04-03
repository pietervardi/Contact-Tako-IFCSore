const express = require('express');
const { getContacts, getContactById, createContact, updateContact, deleteContact } = require('../controllers/Contacts');
const { verifyUser } = require('../middleware/AuthUser');

const router = express.Router();

router.get('/contacts', verifyUser, getContacts);
router.get('/contacts/:id', verifyUser, getContactById);
router.post('/contacts', verifyUser, createContact);
router.patch('/contacts/:id', verifyUser, updateContact);
router.delete('/contacts/:id', verifyUser, deleteContact);

module.exports = router;