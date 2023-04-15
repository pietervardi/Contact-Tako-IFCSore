import React from 'react';
import { NavLink, useNavigate } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { LogOut, reset } from '../features/authSlice';
import { IoLogOut } from 'react-icons/io5';

const Navbar = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { user } = useSelector((state) => state.auth);

  const logout = () => {
    dispatch(LogOut());
    dispatch(reset());
    navigate('/login');
  };

  return (
    <nav className='navbar navbar-expand-lg navbar-light bg-success p-2 text-dark bg-opacity-25 p-3'>
      <div className='d-flex flex-row ps-3'>
        <NavLink to='/' className='navbar-brand text-uppercase fs-2 fw-semibold'>Septact</NavLink>
      </div>
      <div className='collapse navbar-collapse d-flex flex-row-reverse pe-3' id='navbarNav'>
        <ul className='navbar-nav ml-auto'>
          <li className='nav-item'>
            <span className='nav-link me-4 fs-5'>Welcome back <strong>{user && user.name}</strong></span>
          </li>
          <li className='nav-item'>
            <button onClick={logout} className='btn btn-link nav-link border border-secondary bg-secondary text-white'>
              <IoLogOut /> Log out
            </button>
          </li>
        </ul>
      </div>
    </nav>
  );
};

export default Navbar;