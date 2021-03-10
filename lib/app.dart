import 'package:airport_solution/routes.dart';
import 'package:airport_solution/screens/homePage.dart';
import 'package:airport_solution/screens/loginPage.dart';
import 'package:airport_solution/screens/signupPage.dart';
import 'package:airport_solution/screens/splashScreen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Airport Solution App",
      // home: LoginPage(),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.homePage: (context) => HomePage(),
        MyRoutes.loginPage: (context) => LoginPage(),
        MyRoutes.signupPage: (context) => SignupPage(),
        MyRoutes.splashScreen: (context) => Splashscreen(),
      },
    );
  }
}
