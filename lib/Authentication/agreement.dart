import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/DashBoard/DashHome.dart';

import '../utils/universal_variables.dart';

class AgreementCheck extends StatefulWidget {
  @override
  State<AgreementCheck> createState() => _AgreementCheckState();
}

class _AgreementCheckState extends State<AgreementCheck> {
  bool agreement = false;
  bool isWoman = false;

  void GotoHomePage() {
    if (agreement == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
      SnakBar("Account Created Successfully");
    } else {
      SnakBar("Please Click On Agreement");
    }
  }

  void SnakBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 232, 217),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 127, 106, 232),
          title: Text(
            "Please Read Our Polices",
            style: TextStyle(
              color: UniversalVariables.yellowColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                          "Terms & Conditions:\nDear travelers, thank you very much for choosing us as your tour operator, please be sure to carefully read these terms and make sure you understand your rights and obligations.To secure yours Payment:\nPlease contact us before you make any payment, to notify us with your request. After we have a finalized tour arrangement, we will send you a tour itinerary confirmation as well as quotation of the tour arrangement, and a certain amount of deposit will be required to secure your booking.\nPayment Policy:\nReservations should be made as early as possible to book the desired holiday, your booking will be secured upon receive a deposit of 20 % or up to 50% during the holidays. The deposit forms part of your total payment, balance payment should be settled at least 7 days before your arrival. For last minute booking , full payment is required upon booking.\nCancellation & Refunds:\nWe would feel sorry if you decided to cancel your trip, however we realize that the majority do so out of necessity.\nIf you must cancel your trip, please submit your cancellation request in written form.REFUNDS FOR MISSING DAYS:\nRefunds will not be made for unused sight-seeing tours or meals.\nDISCLAMIER:\nTravel Here will not be responsible in the event of a sudden emergency before or during your trip and coverage for trip cancellation or interruption, illness, injury, and damage, loss or theft of baggage, as well as emergency assistance.\n"),
                    )
                ),
                Checkbox(
                    value: agreement,
                    onChanged: (value) {
                      setState(() {
                        agreement = value!;
                        print('value____________' + value.toString());
                      });
                    }),
                Text(
                  "Agree??",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            UniversalVariables.yellowColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                      onPressed: () {
                        GotoHomePage();
                      },
                      child: Text("Submit",
                          style: TextStyle(
                              color: UniversalVariables.whiteColor,
                              fontSize: 20)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
