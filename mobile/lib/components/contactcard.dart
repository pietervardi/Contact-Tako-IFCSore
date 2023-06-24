import 'package:flutter/material.dart';
import 'package:mobile/screen/formeditcontact_screen.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String image;

  const ContactCard({
    Key? key,
    required this.name,
    required this.phone,
    required this.address,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 160,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            )
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(
                      width: 85,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6C757D),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FormEditContact(contact: {
                                'name': name,
                                'phone': phone,
                                'address': address,
                                'image': image,
                              }),
                            ),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.edit,
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDC3545),
                        ),
                        onPressed: () {
                          
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.delete,
                              size: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}