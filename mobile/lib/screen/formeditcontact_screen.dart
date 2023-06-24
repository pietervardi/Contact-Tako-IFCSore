import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';
import 'package:image_picker/image_picker.dart';

class FormEditContact extends StatefulWidget {
  final Map<String, dynamic> contact;
  const FormEditContact({Key? key, required this.contact}) : super(key: key);

  @override
  State<FormEditContact> createState() => _FormEditContactState();
}

class _FormEditContactState extends State<FormEditContact> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.contact['name'];
    phoneController.text = widget.contact['phone'];
    addressController.text = widget.contact['address'];
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Welcome(),
              const SizedBox(height: 20),
              const TitleApp(),
              const Text('Edit Contact',style: TextStyle(fontSize: 12),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Name",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Phone",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Phone',
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Address',
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Image",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {
                      myAlert();
                    },
                    child: const Text('Upload Photo'),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  const SizedBox(
                    height: 10,
                  ),
                  //if image not null show the image
                  //if image null show text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.contact['image'],
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),

                  const Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                  color: Colors.grey[700]),
                              child: const Text(
                                "Back",
                                style: TextStyle(color: Colors.white),
                              ))),
                      TextButton(
                          onPressed: () {},
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  color: Colors.blue),
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ))),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
