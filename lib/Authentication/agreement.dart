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

  void GotoHomePage(){
    if(agreement==true){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
      SnakBar("Account Created Successfully");
    }else{
      SnakBar("Please Click On Agreement");
    }
  }
  void SnakBar(String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Please Read Our Polices"),),
        body: Container(
          child: Column(
            children: [
              Container(child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Product tours handle the essential job of introducing and familiarizing users with your product or new features. When executed well, they improve UX and encourage users to take meaningful actions. Great product tours also decrease new users’ time to value, enhancing conversion, activation, and retention rates.However, when they first hit the market, product tours got a bad name. V1 product tours weren’t interactive or efficient. Long tours bombarded users right when they logged onto the platform, forcing them to click through every little thing the platform could do. Overall, product tours were overwhelming and not immediately helpful, with no clear goal in mind. Chances are you’ve taken a bad product tour, but we can guarantee it wasn’t a Lou product tour.In fact, the contrast between good product tours and bad product tours was so stark that some companies started labeling good, interactive product tours as “guided tours” or “product walkthroughs.” They claim they are better than typical product tours because they interactively teach and help users reach milestones and key activities. Here at Lou, we think that’s exactly what a great product tour should do. So we keep it simple and just call product tours, product tours.Let’s dive into what makes a great product tour and why they’re a powerful tool for increasing product adoption."),
              )),
              Checkbox(
                  value: agreement,
                  onChanged: (value) {
                    setState(() {
                      agreement = value!;
                      print('value____________'+value.toString());
                    });
                  }),
              Text("Agree??",style: TextStyle(color: UniversalVariables.orangeColor,fontSize: 18),),
             Container(
               margin: EdgeInsets.all(15),
               child:  SizedBox(
                 width: double.infinity,
                 child: TextButton(
                   style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all(UniversalVariables.orangeColor),
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),)
                     ),),
                   onPressed: (){
                     GotoHomePage();
                   },
                   child: Text("Submit",style:TextStyle(color: UniversalVariables.whiteColor,fontSize: 20)),
                 ) ,
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
