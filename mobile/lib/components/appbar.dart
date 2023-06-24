import 'package:flutter/material.dart';
import 'package:mobile/screen/login_screen.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFF5CB85C).withOpacity(0.25),
    toolbarHeight: 70,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: const Text(
      'SEPTACT',
      style: TextStyle(
          fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C757D)),
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
            child: Row(
              children: const [
                Icon(
                  Icons.logout,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(fontSize: 12),
                )
              ],
            )),
      ),
    ],
  );
}
