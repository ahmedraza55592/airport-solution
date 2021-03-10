import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xffEFE7E7),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(
              height: 70.0,
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 30.0,
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
                SizedBox(height: 5),
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
                        _email = value;
                      });
                    },
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Enter Phone Number",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightgrey,
                              width: BaseStyles.borderWidth),
                          borderRadius:
                              BorderRadius.circular(BaseStyles.borderRadius)),
                    ),
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightgrey,
                              width: BaseStyles.borderWidth),
                          borderRadius:
                              BorderRadius.circular(BaseStyles.borderRadius)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter Password Again",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.lightgrey,
                              width: BaseStyles.borderWidth),
                          borderRadius:
                              BorderRadius.circular(BaseStyles.borderRadius)),
                    ),
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: GoogleFonts.lato().fontFamily),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.pushReplacementNamed(context, MyRoutes.homePage);
                  },
                  child: Container(
                    height: 40,
                    width: 170,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 350,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up with facebook",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 350,
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up with Google",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
