import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome ({Key? key}) : super(key: key);
  final String userName = 'Michael Lay';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}