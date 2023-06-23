import 'package:flutter/material.dart';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/contactcard.dart';
import 'package:mobile/components/title.dart';
import 'package:mobile/components/welcome.dart';
import 'package:mobile/screen/formaddcontact_screen.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, dynamic>> contacts = [
    {
      'name': 'Pieter Vardi',
      'phone': '08123456789',
      'address': 'Jalan Asia no 15A',
      'image': 'assets/comb_over.jpg',
    },
    {
      'name': 'Jecksen Santoko',
      'phone': '08123456798',
      'address': 'Jalan Amerika no 18',
      'image': 'assets/comma_hair.jpg',
    },
    {
      'name': 'Victor',
      'phone': '08987654321',
      'address': 'Jalan Krakatau no 19C',
      'image': 'assets/barber1.jpg',
    },
    {
      'name': 'Louis',
      'phone': '08231456121',
      'address': 'Jalan Bintang no 2Y',
      'image': 'assets/fluffy.jpg',
    },
    {
      'name': 'Nicholas Chandra',
      'phone': '08192836183',
      'address': 'Jalan Afrika no 20A',
      'image': 'assets/french_crop.jpg',
    },
    {
      'name': 'Hansen Tanio',
      'phone': '081927351868',
      'address': 'Jalan Sunggal no 26C',
      'image': 'assets/two_blocks.jpeg',
    },
    {
      'name': 'Vincent Chaislie',
      'phone': '08231456333',
      'address': 'Jalan Cemara no 10',
      'image': 'assets/buzzcut.jpg',
    },
    {
      'name': 'Antony',
      'phone': '082314545410',
      'address': 'Jalan Merauke no 1F',
      'image': 'assets/barber2.jpeg',
    },
    {
      'name': 'Mario',
      'phone': '081178374814',
      'address': 'Jalan Kambing no 22G',
      'image': 'assets/undercuts.jpeg',
    },
    {
      'name': 'Owen Mastan',
      'phone': '081383838911',
      'address': 'Jalan Harimau no 2D',
      'image': 'assets/mullet.jpg',
    },
  ];

  List<Map<String, dynamic>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String searchQuery) {
    setState(() {
      filteredContacts = contacts
        .where((contact) =>
          contact['name']!.toLowerCase().contains(searchQuery) ||
          contact['phone']!.toLowerCase().contains(searchQuery) ||
          contact['address']!.toLowerCase().contains(searchQuery))
        .toList();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Welcome(),
              const SizedBox(height: 20,),
              const TitleApp(),
              const SizedBox(height: 25,),
              const Text(
                'List of Contacts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search Contacts...',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: filterContacts,
                ),
              ),
              Column(
                children: [
                  for (var contact in filteredContacts)
                    Column(
                      children: [
                        ContactCard(
                          name: contact['name']!,
                          phone: contact['phone']!,
                          address: contact['address']!,
                          image: contact['image']!,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}