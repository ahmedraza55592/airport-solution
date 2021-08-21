import 'package:airport_solution/models/entries.dart';
import 'package:airport_solution/models/vehicles.dart';
import 'package:airport_solution/styles/base.dart';
import 'package:airport_solution/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'confirmDetails.dart';

class SelectVehicle extends StatelessWidget {
  final String fromMapAddress;
  final String toMapAddress;
  final String date;
  final String time;
  final String passengers;
  final String luggages;
  final String distance;

  SelectVehicle(
      {Key key,
      this.fromMapAddress,
      this.toMapAddress,
      this.date,
      this.time,
      this.passengers,
      this.luggages,
      this.distance})
      : super(key: key);

  final entry = Entry();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(BaseStyles.borderRadius),
                  topRight: Radius.circular(BaseStyles.borderRadius))),
          child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      print("----------------------------");
                      print("From: " + fromMapAddress);
                      print("To: " + toMapAddress);
                      print("Date: " + date);
                      print("Time: " + time);
                      print("Passengers: " + passengers);
                      print("Luggages: " + luggages);
                      print("Vehicle Name is: " + vehicles[index].name);
                      print("Vehicle image is: " + vehicles[index].image);
                      print("Total Price are: " +
                          vehicles[index].price.toString());
                      print("----------------------------");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmDetails(
                            fromMapAddress: fromMapAddress,
                            toMapAddress: toMapAddress,
                            date: date,
                            time: time,
                            passengers: passengers,
                            luggages: luggages,
                            vehicleName: vehicles[index].name,
                            vehicleImage: vehicles[index].image,
                            totalPrice:
                                vehicles[index].price * double.parse(distance),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColors.red,
                                maxRadius: 50.0,
                                backgroundImage:
                                    AssetImage(vehicles[index].image),
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
                                  vehicles[index].name,
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
                                    Text(
                                        "  Max Passengers: " +
                                            vehicles[index].passengers,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily:
                                                GoogleFonts.lato().fontFamily)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.business_center),
                                    Text(
                                        "  Max Luggage: " +
                                            vehicles[index].luggage,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontFamily:
                                                GoogleFonts.lato().fontFamily)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                        " £  " +
                                            vehicles[index].price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20.0,
                                            fontFamily: GoogleFonts.roboto()
                                                .fontFamily)),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 140,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Book Now",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                      decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                      ],
                    ),
                  )),
        ));
  }
}
