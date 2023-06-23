import 'package:flutter/material.dart';
import 'package:mobile/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const Text('Form Register'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }, 
                child: const Text('Save')
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: const Text('Back')
              ),
            ]
          ),
        ),
      ),
    );
  }
}