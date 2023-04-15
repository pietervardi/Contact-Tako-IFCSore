<<<<<<< HEAD
import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Card from './Card';

const ContactList = () => {
  const [contacts, setContacts] = useState([]);

  useEffect(() => {
    getContacts();
  }, []);

  const getContacts = async () => {
    const response = await axios.get('http://localhost:5000/contacts');
    setContacts(response.data);
  };

  const deleteContact = async (contactId) => {
    try {
      await axios.delete(`http://localhost:5000/contacts/${contactId}`);
      getContacts();
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div className='container-fluid'>
      <h1 className='text-center mt-2 mb-3'>Contacts</h1>
      <h3 className='fw-normal'>List of Contacts</h3>
      <Link to='/contacts/add' className='btn btn-primary mb-2'>
        Add New
      </Link>
      <div className='d-flex justify-content-start flex-wrap'>
        {contacts.length === 0 ? "No Contact" : contacts.map(contact => (
          <Card
            key={contact.uuid} 
            contact={contact}
            deleteContact={deleteContact}
          />
        ))}
      </div>
    </div>
  );
};

export default ContactList;
=======
import React from 'react'

const ContactList = () => {
  return (
    <div>ContactList</div>
  )
}

export default ContactList
>>>>>>> 9f57c5259edc80dc18c7dc396c2f97556cd53a41
