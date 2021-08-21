import 'package:airport_solution/providers/authProvider.dart';
import 'package:airport_solution/routes.dart';
import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:airport_solution/styles/text.dart';
import 'package:airport_solution/widgets/socialButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.lightgrey, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius));
  }

  OutlineInputBorder buildOutlineInputBorderFocused() {
    return OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.blue, width: BaseStyles.borderWidth),
        borderRadius: BorderRadius.circular(BaseStyles.borderRadius));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Material(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter email",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Username cannot be empty";
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return "Please Enter a valid email";
                        }
                        return null;
                      },
                      onChanged: authProvider.changeEmail,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: GoogleFonts.lato().fontFamily),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                      onChanged: authProvider.changePassword,
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
                            Navigator.pushNamed(
                                context, MyRoutes.resetPassword);
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
                      if (_formKey.currentState.validate()) {
                        authProvider.signInEmail(context);
                      }
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
                  SizedBox(
                    height: 6.0,
                  ),
                  Center(
                    child: Text('Or', style: TextStyles.suggestion),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: BaseStyles.listPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppSocialButton(socialType: SocialType.Google),
                        SizedBox(
                          width: 15.0,
                        ),
                        AppSocialButton(socialType: SocialType.Facebook),
                      ],
                    ),
                  ),
                  Padding(
                    padding: BaseStyles.listPadding,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'New Here? ',
                          style: TextStyles.body,
                          children: [
                            TextSpan(
                                text: 'Signup',
                                style: TextStyles.link,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.pushNamed(
                                      context, MyRoutes.signupPage))
                          ]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
