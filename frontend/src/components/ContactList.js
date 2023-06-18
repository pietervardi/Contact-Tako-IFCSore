import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import Card from './Card';

const ContactList = () => {
  const [contacts, setContacts] = useState([]);
  const [page, setPage] = useState(0);
  const [limit, setLimit] = useState(8);

  useEffect(() => {
    getContacts();
  }, [page]);

  const getContacts = async () => {
    const response = await axios.get(
      `http://localhost:5000/contacts?page=${page}&limit=${limit}`
    );
    setContacts(response.data.result);
    setPage(response.data.page);
  };

  const changePage = (newPage) => {
    setPage(newPage);
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
      <div className='d-flex justify-content-center mt-2'>
        <button disabled={page === 0} onClick={() => changePage(page - 1)}>
          Previous
        </button>
        {Array.from({ length: contacts.totalPages }, (_, i) => i).map((n) => (
          <button key={n} disabled={n === page} onClick={() => changePage(n)}>
            {n + 1}
          </button>
        ))}
        <button disabled={page + 1 === contacts.totalPages} onClick={() => changePage(page + 1)}>
          Next
        </button>
      </div>
    </div>
  );
};

export default ContactList;