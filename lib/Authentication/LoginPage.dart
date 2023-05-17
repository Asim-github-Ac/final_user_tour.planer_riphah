/*
 * Copyright (c) 2021 Akshay Jadhav <jadhavakshay0701@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 3 of the License, or (at your option) any later
 * version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/Authentication/register.dart';
import 'package:user_tourist/DashBoard/DashHome.dart';
import 'package:user_tourist/DashBoard/homepage.dart';

import '../utils/universal_variables.dart';


class LoginPageContent extends StatefulWidget {
  @override
  _LoginPageContentState createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {

  TextEditingController textNameController=TextEditingController();
  TextEditingController textPasswordController=TextEditingController();
  Future<void> LoginNow() async {
    try {
      final userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(email:textNameController.text,password:textPasswordController.text);
      SnakBar("Successfully Login");
      gotoHomePage();

    } on FirebaseAuthException catch (e) {
      print('error__________________'+e.code);
      SnakBar(e.code);
      switch (e.code) {
        case "wrong-password":
          print("The supplied token is not a Firebase custom auth token.");
          break;
        case "custom-token-mismatch":
          print("The supplied token is for a different Firebase project.");
          break;
        default:
          print("Unkown error.");
      }
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: UniversalVariables.whiteColor,
          padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
          child: Form(

            child: buildForm(),
          ),
        ),
      ),
    );
  }


  buildForm(){
    return Column(
      children:[
        SizedBox(height:20.0),
        Hero(
          tag: 'hero',
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100.0,
            child: Image.network("https://img.freepik.com/free-vector/detailed-travel-logo_23-2148616611.jpg?w=2000"),
          ),
        ),
        SizedBox(height:20.0),
        TextFormField(

          controller: textNameController,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: textPasswordController,
          decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.password_outlined),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        ),
        SizedBox(height:50.0),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(UniversalVariables.orangeColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),)
              ),),
            onPressed: (){
              LoginNow();
            },
            child: Text("Login",style:TextStyle(color: UniversalVariables.whiteColor,fontSize: 24)),
          ) ,
        ),
        TextButton.icon(onPressed:(){gotoRegisterPage();}, icon: Icon(Icons.person_add), label: Text("New User ? Click Here..",style:TextStyle(color: Colors.black45, fontWeight: FontWeight.bold)),)
      ],
    );
  }

  gotoHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
  }

  gotoRegisterPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterPageContent()));
  }
}