import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';

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
              const Text('Edit Contact'),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
