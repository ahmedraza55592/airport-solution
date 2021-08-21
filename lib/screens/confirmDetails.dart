import 'package:airport_solution/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmDetails extends StatelessWidget {
  final String fromMapAddress;
  final String toMapAddress;
  final String date;
  final String time;
  final String passengers;
  final String luggages;
  final String vehicleName;
  final String vehicleImage;
  final double totalPrice;

  ConfirmDetails(
      {Key key,
      this.fromMapAddress,
      this.toMapAddress,
      this.date,
      this.time,
      this.passengers,
      this.luggages,
      this.vehicleName,
      this.vehicleImage,
      this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Confirm Details",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.0,
                fontFamily: GoogleFonts.roboto().fontFamily),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To:  " + toMapAddress,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Text(
                  "From:  " + fromMapAddress,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Text(
                  "Date:  " + date,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Text(
                  "Time:  " + time,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15.0,
                      fontFamily: GoogleFonts.roboto().fontFamily),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.red,
                      maxRadius: 50.0,
                      backgroundImage: AssetImage(vehicleImage),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .05,
                    ),
                    Container(
                      color: AppColors.lightgrey,
                      width: 2.0,
                      height: 100.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicleName,
                          style: TextStyle(
                            color: AppColors.lightgrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.people_alt_rounded),
                            Text("  Passengers: " + passengers,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: GoogleFonts.lato().fontFamily)),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Icon(Icons.business_center),
                            Text("  Luggage: " + luggages,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: GoogleFonts.lato().fontFamily)),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
          ),
          Text("Total :  £  " + totalPrice.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  fontFamily: GoogleFonts.roboto().fontFamily)),
          SizedBox(
            height: MediaQuery.of(context).size.height * .07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: Text(
                    "Pay Now",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  child: Text(
                    "Pay Later",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),

          // Row(
          //   children: [
          //     CircleAvatar(
          //       backgroundImage: AssetImage("assets/images/a.png"),
          //       // foregroundImage: AssetImage("assets/images/a.png"),
          //       // child: Image.asset("assets/images/a.png")
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * .05,
          //     ),
          //     Container(
          //       color: AppColors.lightgrey,
          //       width: 2.0,
          //       height: 300.0,
          //     ),
          //     SizedBox(
          //       width: MediaQuery.of(context).size.width * .05,
          //     ),
          //     Container(
          //       height: 200,
          //       width: 100,
          //       color: Colors.red,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}

// ConfirmDetails({Key key, @required this.fromMapAddress}) : super(key: key);
