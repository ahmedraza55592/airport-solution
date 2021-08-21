import 'package:airport_solution/providers/authProvider.dart';
import 'package:airport_solution/routes.dart';
import 'package:airport_solution/screens/confirmDetails.dart';
import 'package:airport_solution/screens/forgotPassword.dart';
import 'package:airport_solution/screens/homePage.dart';
import 'package:airport_solution/screens/loginPage.dart';
import 'package:airport_solution/screens/selectVehicle.dart';
import 'package:airport_solution/screens/signupPage.dart';
import 'package:airport_solution/screens/verifyEmail.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:airport_solution/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        title: "Airport Solution App",

        // if already logged in then go to homepage else go to login page
        home: Constants.prefs.getBool("loggedIn") == true
            ? HomePage()
            : LoginPage(),
        routes: {
          MyRoutes.homePage: (context) => HomePage(),
          MyRoutes.loginPage: (context) => LoginPage(),
          MyRoutes.signupPage: (context) => SignupPage(),
          MyRoutes.verifyEmail: (context) => VerifyEmail(),
          MyRoutes.resetPassword: (context) => ForgotPassword(),
          MyRoutes.confirmDetails: (context) => ConfirmDetails(),
          MyRoutes.selectVehicle: (context) => SelectVehicle()
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: AppColors.blue),
      ),
    );
  }
}
