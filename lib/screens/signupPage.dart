import 'package:airport_solution/providers/authProvider.dart';
import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:airport_solution/styles/text.dart';
import 'package:airport_solution/widgets/socialButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final auth = FirebaseAuth.instance;

  var confirmPass;

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
              height: MediaQuery.of(context).size.height * 0.1,
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
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      decoration: InputDecoration(
                        labelText: "UserName",
                        hintText: "Enter user name",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "UserName cannot be empty";
                        } else if (!RegExp(
                                r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$')
                            .hasMatch(value)) {
                          return "Please enter a valid userName";
                        }
                        return null;
                      },
                      onChanged: authProvider.changeUserName,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: GoogleFonts.lato().fontFamily),
                      keyboardType: TextInputType.name,
                    ),
                  ),
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
                          return "Email cannot be empty";
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      onChanged: authProvider.changeEmail,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: GoogleFonts.lato().fontFamily),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter Phone Number",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Phone No cannot be empty";
                        } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                            .hasMatch(value)) {
                          return "Please enter a valid phone Number";
                        }
                        return null;
                      },
                      onChanged: authProvider.changePhoneNo,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: GoogleFonts.lato().fontFamily),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        confirmPass = value;
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password lenght should be altleast 8";
                        }
                        return null;
                      },
                      onChanged: authProvider.changePassword,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: GoogleFonts.lato().fontFamily),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppColors.blue,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Enter Password Again",
                        border: buildOutlineInputBorder(),
                        focusedBorder: buildOutlineInputBorderFocused(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Confirm Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password lenght should be altleast 8";
                        } else if (value != confirmPass) {
                          return "Password must be same as above";
                        }
                        return null;
                      },
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
                      if (_formKey.currentState.validate()) {
                        authProvider.signupEmail(context);
                      }
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
                            text: 'Already Have an Account? ',
                            style: TextStyles.body,
                            children: [
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyles.link,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () =>
                                        Navigator.pushNamed(context, '/login'))
                            ])),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
