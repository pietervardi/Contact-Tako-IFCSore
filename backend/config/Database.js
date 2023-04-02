const { Sequelize } = require('sequelize');

const db = new Sequelize('tugas_db', 'root', '', {
  dialect: 'sqlite',
  host: './data/dev.sqlite'
});

module.exports = db;