import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';

class FormEditContact extends StatefulWidget {
  const FormEditContact({Key? key}) : super(key: key);

  @override
  State<FormEditContact> createState() => _FormEditContactState();
}

class _FormEditContactState extends State<FormEditContact> {
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
              Text('Edit Contact')
            ],
          ),
        ),
      ),
    );
  }
}