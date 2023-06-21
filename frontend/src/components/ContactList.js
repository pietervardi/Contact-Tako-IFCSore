import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import useSWR, { useSWRConfig } from 'swr';
import Card from './Card';

const ContactList = () => {
  const { mutate } = useSWRConfig();
  const [page, setPage] = useState(0);
  const [limit, setLimit] = useState(8);
  const [search, setSearch] = useState('');

  const getContacts = async () => {
    const response = await axios.get(`http://localhost:5000/contacts?page=${page}&limit=${limit}`);
    return response.data;
  };

  const { data } = useSWR(`contacts?page=${page}&limit=${limit}`, getContacts, { page, limit });
  if (!data) return <h2>Loading...</h2>;

  const deleteContact = async (contactId) => {
    try {
      await axios.delete(`http://localhost:5000/contacts/${contactId}`);
      mutate(`contacts?page=${page}&limit=${limit}`);;
    } catch (error) {
      console.log(error);
    }
  };

  const changePage = (newPage) => {
    setPage(newPage);
  };

  return (
    <div className='container-fluid'>
      <h1 className='text-center mt-2 mb-3'>Contacts</h1>
      <h3 className='fw-normal'>List of Contacts</h3>
      <Link to='/contacts/add' className='btn btn-primary mb-2'>
        Add New
      </Link>
      <div className='input-group mb-3'>
        <input
          type='text'
          className='form-control'
          placeholder='Search Contacts...'
          onChange={(e) => setSearch(e.target.value)}
        />
        <button className='btn btn-outline-secondary' type='button'>
          Search
        </button>
      </div>
      <div className='d-flex justify-content-start flex-wrap'>
        {data.result
          .filter((item) => {
            const lowercaseSearch = search.toLowerCase();
            const lowercaseName = item.name.toLowerCase();
            const lowercasePhone = item.phone.toLowerCase();
            const lowercaseAddress = item.address.toLowerCase();

            return (
              lowercaseSearch === '' ||
              lowercaseName.includes(lowercaseSearch) ||
              lowercasePhone.includes(lowercaseSearch) ||
              lowercaseAddress.includes(lowercaseSearch)
            );
          })
          .map((item) => (
            <Card
              key={item.uuid}
              contact={item}
              deleteContact={deleteContact}
            />
          ))}
      </div>
      <div className='d-flex justify-content-center mt-2'>
        <button disabled={page === 0} onClick={() => changePage(page - 1)}>
          Previous
        </button>
        {Array.from({ length: data.totalPages }, (_, i) => i).map((n) => (
          <button key={n} disabled={n === page} onClick={() => changePage(n)}>
            {n + 1}
          </button>
        ))}
        <button disabled={page + 1 === data.totalPages} onClick={() => changePage(page + 1)}>
          Next
        </button>
      </div>
    </div>
  );
};

export default ContactList;