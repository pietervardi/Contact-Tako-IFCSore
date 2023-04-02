const express = require('express');
const { getContacts, getContactById, createContact, updateContact, deleteContact } = require('../controllers/Contacts');

const router = express.Router();

router.get('/contacts', getContacts);
router.get('/contacts/:id', getContactById);
router.post('/contacts', createContact);
router.patch('/contacts/:id', updateContact);
router.delete('/contacts/:id', deleteContact);

module.exports = router;