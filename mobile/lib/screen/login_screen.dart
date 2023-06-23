import 'package:flutter/material.dart';
import 'package:mobile/screen/contact_page.dart.dart';
import 'package:mobile/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            height: 425,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: 3)
                ]),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: TextField(
                              decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                          )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextField(
                              decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Password',
                          )),
                        ),
                        Center(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 112)),
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                          Color(0xFF35C680))),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ContactPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Color(0xFF0E9C58), fontSize: 25),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}