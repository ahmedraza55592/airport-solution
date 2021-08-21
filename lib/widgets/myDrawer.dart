import 'package:airport_solution/models/user.dart';
import 'package:airport_solution/providers/authProvider.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:airport_solution/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../routes.dart';

class MyDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<AuthProvider>(context);

    return Drawer(
      child: Container(
        child: ListView(
          children: [
            StreamBuilder<List<Users>>(
                stream: userinfo.entries,
                builder: (context, snapshot) {
                  return UserAccountsDrawerHeader(
                    accountEmail: Text(''),
                    decoration: BoxDecoration(color: Colors.white),
                    accountName: Text(
                      snapshot.data.first.userName,
                      style: TextStyle(color: Colors.black),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: AppColors.lightwhite,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            InkWell(
              onTap: () {
                Constants.prefs.setBool("loggedIn", false);
                auth.signOut();
                Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 70.0, right: 70.0, bottom: 20.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.center,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontFamily: GoogleFonts.roboto().fontFamily),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
