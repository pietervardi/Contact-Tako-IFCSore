import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { Link, useNavigate } from 'react-router-dom';
import { LoginUser, reset } from '../features/authSlice';
import '../style/Login.css'

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user, isError, isSuccess, isLoading, message } = useSelector(
    (state) => state.auth
  );

  useEffect(() => {
    if (user || isSuccess) {
      navigate('/');
    }
    dispatch(reset());
  }, [user, isSuccess, dispatch, navigate]);

  const Auth = (e) => {
    e.preventDefault();
    dispatch(LoginUser({ email, password }));
  };

  return (
    <div className='container1'>
      <form onSubmit={Auth} className='form1'>
        {isError && <p className='formMessage'>{message}</p>}
        <h1 className='formHeader'>Sign In</h1>
        <div className='email1'>
          <label className='emailLabel'>Email</label>
          <div>
            <input
              type='text'
              className='input1'
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              placeholder='Email'
            />
          </div>
        </div>
        <div className='password1'>
          <label className='passwordLabel'>Password</label>
          <div>
            <input
              type='password'
              className='input1'
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              placeholder='Enter Password'
            />
          </div>
        </div>
        <div>
          <button 
            type='submit'
            className='submit2'>
            {isLoading ? 'Loading...' : 'Login'}
            </button>
        </div>
        <div className='register1'>
          <Link to='/register' className=''>
            Register
          </Link>
        </div>
      </form>
    </div>
  );
};

export default Login;