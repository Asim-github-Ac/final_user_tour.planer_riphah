import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/DashBoard/Payment%20Details.dart';

import '../utils/universal_variables.dart';

class BookTours extends StatefulWidget {
  const BookTours({Key? key, required this.url, required this.place, required this.desplace, required this.expense, required this.date, required this.stay, required this.city}) : super(key: key);
  final String url;
  final String place;
  final String desplace;
  final String expense;
  final String date;
  final String stay;
  final String city;
  @override
  State<BookTours> createState() => _BookToursState();
}

class _BookToursState extends State<BookTours> {

  TextEditingController tvname = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController email = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 232, 217),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 127, 106, 232),
          title: Text(
            "Please Book Your Tour",
            style: TextStyle(
              color: UniversalVariables.yellowColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Card(
            color: Color.fromARGB(255, 247, 232, 217),
            elevation: 10,
            // margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 360, child: Image.network('${widget.url}')),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Text(
                          "Place Name: ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 106, 232),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('${widget.place}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Text(
                          "Tour Expense: ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 106, 232),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('${widget.expense}')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(55, 12, 0, 0),
                          child: Center(
                            child: Text(
                              "Are You Sure To Confirm Tour ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 106, 232),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: UniversalVariables.yellowColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      maximumSize: const Size(200, 45),
                      minimumSize: const Size(200, 45),
                    ),
                    child: const Text(
                      "Confirm Tour",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 185,
                  )
                ],
              ),
            )));
  }
}
