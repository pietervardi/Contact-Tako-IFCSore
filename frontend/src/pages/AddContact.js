import React, { useEffect } from 'react';
import Layout from './Layout';
import FormAddContact from '../components/FormAddContact';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';

const AddContact = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { isError } = useSelector((state) => state.auth);

  useEffect(() => {
    dispatch(getMe());
  }, [dispatch]);

  useEffect(() => {
    if (isError) {
      navigate('/login');
    }
  }, [isError, navigate]);
  return (
    <Layout>
      <FormAddContact />
    </Layout>
  );
};

export default AddContact;

