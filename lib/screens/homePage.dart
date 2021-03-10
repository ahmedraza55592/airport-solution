import 'package:airport_solution/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        child: Text("Logout"),
        onPressed: () {
          auth.signOut();
          Navigator.pushNamed(context, MyRoutes.loginPage);
        },
      )),
    );
  }
}
