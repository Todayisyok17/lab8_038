import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lab8_038/pages/profile.dart';
import 'package:lab8_038/services/auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
        child: Container(
          child: GoogleAuthButton(
            onPressed: () {
              authService.signInWithGoogle().then(
                (value) {
                  print(value);
                
                 Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                    ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}