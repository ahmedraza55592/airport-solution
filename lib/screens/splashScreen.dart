import 'package:airport_solution/screens/loginPage.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: LoginPage(),
      image: Image(
        image: AssetImage('assets/images/logo.png'),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      backgroundColor: AppColors.lightwhite,
      photoSize: 100,
      useLoader: false,
    );
  }
}
