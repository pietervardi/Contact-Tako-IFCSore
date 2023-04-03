const User = require('../models/UserModel');
const argon2 = require('argon2');

const login = async (req, res) => {
  const user = await User.findOne({
    where: {
      email: req.body.email
    }
  });
  if (!user) return res.status(404).json({ msg: "User tidak ditemukan" });
  const match = await argon2.verify(user.password, req.body.password);
  if (!match) return res.status(400).json({ msg: "Wrong password" });
  req.session.userId = user.uuid;
  const uuid = user.uuid;
  const name = user.name;
  const email = user.email;
  res.status(200).json({ uuid, name, email });
};

const register = async (req, res) => {
  const { name, email, password, confPassword } = req.body;
  const user = await User.findOne({
    where: {
      email: req.body.email
    }
  });
  if (user) return res.status(404).json({ msg: "Email telah digunakan" });
  if (password !== confPassword) return res.status(400).json({ msg: "Password dan Confirm Password tidak cocok" })
  const hashPassword = await argon2.hash(password);
  try {
    await User.create({
      name, email,
      password: hashPassword
    });
    res.status(201).json({ msg: "Register Berhasil" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

const Me = async (req, res) => {
  if (!req.session.userId) {
    return res.status(401).json({ msg: "Mohon login ke akun Anda!" });
  }
  const user = await User.findOne({
    attributes: ['uuid', 'name', 'email'],
    where: {
      uuid: req.session.userId
    }
  });
  if (!user) return res.status(404).json({ msg: "User tidak ditemukan" });
  res.status(200).json(user);
}

const logOut = (req, res) => {
  req.session.destroy((err) => {
    if (err) return res.status(400).json({ msg: "Tidak dapat logout" });
    res.status(200).json({ msg: "Anda telah logout" });
  });
};

module.exports = { login, Me, register, logOut };