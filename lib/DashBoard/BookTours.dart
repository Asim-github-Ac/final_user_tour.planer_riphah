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
      appBar: AppBar(
        backgroundColor: UniversalVariables.orangeColor,
        title: Text("Book Tour"),),
        body: SingleChildScrollView(
        child: Container(
        color: UniversalVariables.whiteColor,
        padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
    child: Form(
    child: buildForm(),),
        )
    ),
    );
  }
  buildForm(){
    return Column(
      children:[
        SizedBox(height: 15,),
        Container(height: 100,
          child: Image.network("https://www.bookyourtour.me/images/book-your-tour/BOOK-YOUR-TOUR-logo-color.png"),
        ),
        SizedBox(height:20.0),
        TextFormField(
          controller: tvname,
          decoration: InputDecoration(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 15,),
        TextFormField(
          controller: email,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 15,),

        TextFormField(
          controller: address,
          decoration: InputDecoration(
            hintText: 'Enter Address',
            prefixIcon: Icon(Icons.location_off),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height: 15,),
        TextFormField(
          controller: phonenumber,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            prefixIcon: Icon(Icons.phone),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(UniversalVariables.orangeColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),)
              ),),
            onPressed: (){
              String username= tvname.text.toString();
              String useremail= email.text.toString();
              String useraddress= address.text.toString();
              String userphone= phonenumber.text.toString();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPayment(url:'${widget.url}',place: '${widget.place}',desplace: '${widget.desplace}',expense: '${widget.expense}',date: '${widget.date}',stay: '${widget.stay}',city: '${widget.city}',username: username,useremail: useremail,useraddress: useraddress,userphone: userphone,)
              )
              );
            },
            child: Text("Confirm Now",style:TextStyle(color: UniversalVariables.whiteColor,fontSize: 24)),
          ) ,
        ),
       // TextButton.icon(onPressed:(){gotoLoginPage();}, icon: Icon(Icons.person_add), label: Text("Already Login ? Click Here..",style:TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),)
      ],
    );
  }
}
