import React from 'react';
import { Link } from 'react-router-dom';
import { FaEdit, FaTrash } from 'react-icons/fa';

const ContactCard = ({ contact, deleteContact }) => {
  return (
    <div className="col-sm-4 me-3" style={{width: '32.1%'}}>
      <div className="card mb-3 card-custom">
        <div className="row no-gutters">
          <div className="col-4">
            <img src={contact.url} alt="Img" className="card-img img-fluid" style={{objectFit:"cover",width:"100%",height:"100%"}}/>
          </div>
          <div className="col-8">
            <div className="card-body">
              <h4 className="card-title">{contact.name}</h4>
              <h5 className="card-subtitle mb-2 text-muted">{contact.phone}</h5>
              <p className="card-text">{contact.address}</p>
              <Link
                to={`/contacts/edit/${contact.uuid}`}
                className="btn btn-secondary mr-2"
              >
                <FaEdit /> Edit
              </Link>
              &nbsp;
              <button
                onClick={() => deleteContact(contact.uuid)}
                type="button"
                className="btn btn-danger"
              >
                <FaTrash /> Delete
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
};

<<<<<<< HEAD
export default ContactCard;
=======
export default ContactCard;
>>>>>>> 9f57c5259edc80dc18c7dc396c2f97556cd53a41
