const express = require('express');
const dotenv = require('dotenv');

const ContactRoute = require('./routes/ContactRoute');
const AuthRoute = require('./routes/AuthRoute');
const db = require('./config/Database');

dotenv.config();
const app = express();

db.sync();

app.use(cors({
  credetials: true,
  origin: 'http://localhost:3000'
}));

app.use(express.json());

app.use(ContactRoute);
app.use(AuthRoute);

app.listen(process.env.APP_PORT, () => {
  console.log(`Listening to port ${process.env.APP_PORT}`);
});