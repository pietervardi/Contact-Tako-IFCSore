import React, { useEffect } from 'react';
import Layout from './Layout';
import FormEditContact from '../components/FormEditContact';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { getMe } from '../features/authSlice';

const EditContact = () => {
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
      <FormEditContact />
    </Layout>
  );
};

export default EditContact;
