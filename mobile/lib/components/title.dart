import 'package:flutter/material.dart';

class TitleApp extends StatelessWidget {
  const TitleApp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Contacts',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}