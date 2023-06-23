import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';

class FormAddContact extends StatefulWidget {
  const FormAddContact({Key? key}) : super(key: key);

  @override
  State<FormAddContact> createState() => _FormAddContactState();
}

class _FormAddContactState extends State<FormAddContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Welcome(),
              SizedBox(height: 20,),
              TitleApp(),
              Text('Add New Contact')
            ],
          ),
        ),
      ),
    );
  }
}