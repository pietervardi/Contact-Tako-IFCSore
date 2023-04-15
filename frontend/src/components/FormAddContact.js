<<<<<<< HEAD
import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate, Link } from 'react-router-dom';

const FormAddContact = () => {
  const [name, setName] = useState('');
  const [phone, setPhone] = useState('');
  const [address, setAddress] = useState('');
  const [file, setFile] = useState("");
  const [preview, setPreview] = useState("");
  const [msg, setMsg] = useState('');
  const navigate = useNavigate();

  const loadImage = (e) => {
    const image = e.target.files[0];
    setFile(image);
    setPreview(URL.createObjectURL(image));
  };

  const saveContact = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append("name", name);
    formData.append("phone", phone);
    formData.append("address", address);
    formData.append("file", file);
    try {
      await axios.post('http://localhost:5000/contacts', 
      formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      navigate('/');
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };

  return (
    <div className='container'>
      <h1 className='text-center my-4'>Contacts</h1>
      <h2 className='text-center my-3 fw-normal'>Add New Contact</h2>
      <div className='row justify-content-center'>
        <form onSubmit={saveContact} className='col-lg-8'>
          <p className='text-danger'>{msg}</p>
          <div className='form-group'>
            <label htmlFor='name'>Name</label>
            <input
              type='text'
              className='form-control'
              id='name'
              value={name}
              onChange={(e) => setName(e.target.value)}
              placeholder='Contact Name'
            />
          </div>
          <div className='form-group'>
            <label htmlFor='phone'>Phone</label>
            <input
              type='text'
              className='form-control'
              id='phone'
              value={phone}
              onChange={(e) => setPhone(e.target.value)}
              placeholder='Phone Number'
            />
          </div>
          <div className='form-group'>
            <label htmlFor='address'>Address</label>
            <input
              type='text'
              className='form-control'
              id='address'
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              placeholder='Address'
            />
          </div>
          <div className='form-group'>
            <label htmlFor='image'>Image</label>
            <div className='custom-file'>
              <input
                type='file'
                className='custom-file-input'
                id='image'
                onChange={loadImage}
              />
            </div>
          </div>

          {preview ? (
            <figure className='text-center my-3 d-flex align-items-start'>
              <img src={preview} alt='Preview Img' className='img-thumbnail' style={{width:'120px',height:'120px'}} />
            </figure>
          ) : (
            ""
          )}

          <div className='form-group my-3'>
            <Link Link to='/' className='btn btn-secondary'>
              Back
            </Link>
            &nbsp;
            <button type='submit' className='btn btn-primary float-right'>
              Save
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default FormAddContact;
=======
import React from 'react'

const FormAddContact = () => {
  return (
    <div>FormAddContact</div>
  )
}

export default FormAddContact
>>>>>>> 9f57c5259edc80dc18c7dc396c2f97556cd53a41
