import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/universal_variables.dart';

class AddPayment extends StatefulWidget {

  const AddPayment({Key? key, required this.url, required this.place, required this.desplace, required this.expense, required this.date, required this.stay, required this.city,required this.username,required this.useremail,required this.useraddress,required this.userphone}) : super(key: key);
  final String url;
  final String place;
  final String desplace;
  final String expense;
  final String date;
  final String stay;
  final String city;
  final String username;
  final String useraddress;
  final String userphone;
  final String useremail;
  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: UniversalVariables.orangeColor,
        title: Text("Payment Method"),),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                height: 150,
                width: 150,
                child: Card(
                    child: Text('${widget.username}')),
              ),
              Container(
                height: 150,
                width: 150,
                child: Card(
                    child: Text('${widget.username}')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
