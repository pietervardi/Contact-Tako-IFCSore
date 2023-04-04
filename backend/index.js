const express = require('express');
const FileUpload = require('express-fileupload');
const cors = require('cors');
const session = require('express-session');
const SequelizeStore = require('connect-session-sequelize');
const dotenv = require('dotenv');

const ContactRoute = require('./routes/ContactRoute');
const AuthRoute = require('./routes/AuthRoute');
const db = require('./config/Database');

dotenv.config();
const app = express();

const sessionStore = SequelizeStore(session.Store);
const store = new sessionStore({ db });

db.sync();

app.use(session({
  secret: process.env.SESS_SECRET,
  resave: false,
  saveUninitialized: true,
  store: store,
  cookie: {
    secure: 'auto'
  }
}))

app.use(cors({
  credentials: true,
  origin: 'http://localhost:3000'
}));

app.use(express.json());
app.use(FileUpload());
app.use(express.static('public'));

app.use(ContactRoute);
app.use(AuthRoute);

store.sync();

app.listen(process.env.APP_PORT, () => {
  console.log(`Listening to port ${process.env.APP_PORT}`);
});