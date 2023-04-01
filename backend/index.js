const express = require('express');
const dotenv = require('dotenv');

dotenv.config();
const app = express();

app.use(cors({
  credetials: true,
  origin: 'http://localhost:3000'
}));

app.use(express.json());

app.listen(process.env.APP_PORT, () => {
  console.log(`Listening to port ${process.env.APP_PORT}`);
});