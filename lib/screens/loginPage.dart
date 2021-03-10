import 'package:airport_solution/routes.dart';
import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.lightwhite,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(
              height: 150.0,
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 70.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.loginPage);
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.red,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MyRoutes.signupPage);
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter username",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightgrey,
                              width: BaseStyles.borderWidth),
                          borderRadius:
                              BorderRadius.circular(BaseStyles.borderRadius)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightgrey,
                              width: BaseStyles.borderWidth),
                          borderRadius:
                              BorderRadius.circular(BaseStyles.borderRadius)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: InkWell(
                        onTap: () {
                          print("ForgtoPassword Printed");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: GoogleFonts.lato().fontFamily),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                InkWell(
                  onTap: () {
                    auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.pushReplacementNamed(context, MyRoutes.homePage);
                  },
                  child: Container(
                    height: 45,
                    width: 170,
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
