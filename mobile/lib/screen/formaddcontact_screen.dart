import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';
import 'package:image_picker/image_picker.dart';

class FormAddContact extends StatefulWidget {
  const FormAddContact({Key? key}) : super(key: key);

  @override
  State<FormAddContact> createState() => _FormAddContactState();
}

class _FormAddContactState extends State<FormAddContact> {
  XFile? image;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
              const SizedBox(
                height: 20,
              ),
              const TitleApp(),
              const Text(
                'Add New Contact'
                ,style: TextStyle(fontSize: 12),
              ),
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: TextField(
                        decoration: InputDecoration(
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                        decoration: InputDecoration(
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: TextField(
                        decoration: InputDecoration(
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
                  Row(
                    children: [
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
                      image != null
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  //to show image, you type like this.
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: 300,
                                ),
                              ),
                            )
                          : const Text(
                              "No File Chosen",
                              style: TextStyle(fontSize: 20),
                            ),
                    ],
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
