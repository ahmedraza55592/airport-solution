import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final auth = FirebaseAuth.instance;
  String _email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
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
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: AppColors.blue,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter email",
                    labelStyle: TextStyle(color: AppColors.blue),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightgrey,
                            width: BaseStyles.borderWidth),
                        borderRadius:
                            BorderRadius.circular(BaseStyles.borderRadius)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.blue,
                            width: BaseStyles.borderWidth),
                        borderRadius:
                            BorderRadius.circular(BaseStyles.borderRadius))),
                validator: (value) {
                  if (value.isEmpty) {
                    return "email cannot be empty";
                  } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return "Please Enter a valid email";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
                style: TextStyle(
                    fontSize: 15.0, fontFamily: GoogleFonts.lato().fontFamily),
              ),
              //  TextField(
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(hintText: 'Email'),
              //   onChanged: (value) {
              //     setState(() {
              //       _email = value.trim();
              //     });
              //   },
              // ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 45,
                    width: 170,
                    alignment: Alignment.center,
                    child: Text(
                      "Send Request",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                // ElevatedButton(
                //   child: Text('Send Request'),
                //   onPressed: () {
                //     auth.sendPasswordResetEmail(email: _email);
                //     Navigator.of(context).pop();
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
