const Contact = require('../models/ContactModel');
const User = require('../models/UserModel');
const { Op } = require('sequelize');
const path = require('path');
const fs = require('fs');

const getContacts = async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 0;
    const limit = parseInt(req.query.limit) || 8;
    const offset = limit * page;
    const totalRows = await Contact.count({
      attributes: ['uuid', 'name', 'phone', 'address', 'image', 'url'],
      include: [{
        model: User,
        attributes: ['name', 'email']
      }],
    });
    const totalPages = Math.ceil(totalRows / limit);

    let response;
    response = await Contact.findAll({
      attributes: ['uuid', 'name', 'phone', 'address', 'image', 'url'],
      where: {
        userId: req.userId
      },
      include: [{
        model: User,
        attributes: ['name', 'email']
      }],
      offset,
      limit
    });
    res.status(200).json({
      result: response,
      page: page,
      limit: limit,
      totalRows: totalRows,
      totalPages: totalPages
    });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

const getContactById = async (req, res) => {
  try {
    const contact = await Contact.findOne({
      where: {
        uuid: req.params.id
      }
    });
    if (!contact) return res.status(404).json({ msg: "Data tidak ditemukan" });
    let response;
    response = await Contact.findOne({
      attributes: ['uuid', 'name', 'phone', 'address', 'image', 'url'],
      where: {
        [Op.and]: [{ id: contact.id }, { userId: req.userId }],
      },
      include: [{
        model: User,
        attributes: ['name', 'email']
      }]
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

const createContact = async (req, res) => {
  if (req.files === null) return res.status(400).json({ msg: "No File Uploaded" });
  const { name, phone, address } = req.body;
  const file = req.files.file;
  const fileSize = file.data.length;
  const ext = path.extname(file.name);
  const fileName = file.md5 + ext;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  const allowedType = ['.png', '.jpg', '.jpeg'];

  if (!allowedType.includes(ext.toLowerCase())) return res.status(422).json({ msg: "Invalid Images" });
  if (fileSize > 5000000) return res.status(402).json({ msg: "Image must be less than 5 MB" });

  file.mv(`./public/images/${fileName}`, async (err) => {
    if (err) return res.status(500).json({ msg: err.message });
    try {
      await Contact.create({ name, phone, address, image: fileName, url, userId: req.userId });
      res.status(201).json({ msg: "Contact Created Successfuly" });
    } catch (error) {
      console.log(error.message);
    }
  })
};

const updateContact = async (req, res) => {
  try {
    const contact = await Contact.findOne({
      where: {
        uuid: req.params.id
      }
    });
    if (!contact) return res.status(404).json({ msg: "Data Not Found" });
    if (req.userId !== contact.userId) return res.status(403).json({ msg: "Forbidden Access" });
    const { name, phone, address } = req.body;
    let fileName = "";
    if (req.files === null) {
      fileName = contact.image;
    } else {
      const file = req.files.file;
      const fileSize = file.data.length;
      const ext = path.extname(file.name);
      fileName = file.md5 + ext;
      const allowedType = ['.png', '.jpg', '.jpeg'];

      if (!allowedType.includes(ext.toLowerCase())) return res.status(402).json({ msg: "Invalid Images" });
      if (fileSize > 5000000) return res.status(402).json({ msg: "Image must be less than 5 MB" });

      const filepath = `./public/images/${contact.image}`;
      fs.unlinkSync(filepath);

      file.mv(`./public/images/${fileName}`, (err) => {
        if (err) return res.status(500).json({ msg: err.message });
      });
    }
    const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;

    await Contact.update({ name, phone, address, image: fileName, url }, {
      where: {
        uuid: req.params.id
      }
    });
    res.status(200).json({ msg: "Contact Updated Successfuly" });
  } catch (error) {
    console.log(error.message);
  }
};

const deleteContact = async (req, res) => {
  try {
    const contact = await Contact.findOne({
      where: {
        uuid: req.params.id
      }
    });
    if (!contact) return res.status(404).json({ msg: "Data tidak ditemukan" });
    if (req.userId !== contact.userId) return res.status(403).json({ msg: "Akses terlarang" });
    await Contact.destroy({
      where: {
        [Op.and]: [{ id: contact.id }, { userId: req.userId }],
      }
    });
    res.status(200).json({ msg: "Contact deleted successfully" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

module.exports = { getContacts, getContactById, createContact, updateContact, deleteContact };