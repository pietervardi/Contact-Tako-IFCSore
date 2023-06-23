import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';
import 'package:mobile/screen/formaddcontact_screen.dart';
import 'package:mobile/screen/formeditcontact_screen.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
              const SizedBox(height: 20,),
              const TitleApp(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FormAddContact(),
                    ),
                  );
                }, 
                child: const Text('Add New')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FormEditContact(),
                    ),
                  );
                }, 
                child: const Text('Edit')
              ),
            ],
          ),
        ),
      ),
    );
  }
}