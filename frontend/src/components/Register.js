import React, { useState } from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import '../style/Register.css'

const Register = () => {
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confPassword, setConfPassword] = useState('');
  const [msg, setMsg] = useState('');
  const navigate = useNavigate();

  const saveUser = async (e) => {
    e.preventDefault();
    try {
      await axios.post('http://localhost:5000/register', {
        name: name,
        email: email,
        password: password,
        confPassword: confPassword,
      });
      navigate('/login');
    } catch (error) {
      if (error.response) {
        setMsg(error.response.data.msg);
      }
    }
  };
  return (
    <div className='container1'>
      <div className='form-container'>
      <div className='form-header'>Sign Up</div>
        <form onSubmit={saveUser}>
          <p className='message'>{msg}</p>
          <div className='form-group'>
            <label className='form-label'>Name</label>
            <div className='form-input'>
              <input
                type='text'
                className='input-field'
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder='Name'
              />
            </div>
          </div>
          <div className='form-group'>
            <label className='form-label'>Email</label>
            <div className='form-input'>
              <input
                type='text'
                className='input-field'
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder='Email'
              />
            </div>
          </div>
          <div className='form-group'>
            <label className='form-label'>Password</label>
            <div className='form-input'>
              <input
                type='password'
                className='input-field'
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder='Enter Password'
              />
            </div>
          </div>
          <div className='form-group'>
            <label className='form-label'>Confirm Password</label>
            <div className='form-input'>
              <input
                type='password'
                className='input-field'
                value={confPassword}
                onChange={(e) => setConfPassword(e.target.value)}
                placeholder='Enter Password'
              />
            </div>
          </div>
          <div className='form-group'>
            <div className='form-action'>
              <button type='submit' className='save-button'>
                Save
              </button>
              <div className='back-link'>
                <Link to='/login' >
                  Back
                </Link>
              </div>
            
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Register;
