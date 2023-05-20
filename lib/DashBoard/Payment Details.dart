import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

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

  File? _image;
  late String downurl;
  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
    sendData() async {
      SnakBar("Wait a Minute");
// to upload the image to firebase storage
      var storageimage = FirebaseStorage.instance.ref().child(_image!.path);
      UploadTask task1 = storageimage.putFile(_image!);

// to get the url of the image from firebase storage
      downurl = await (await task1).ref.getDownloadURL();
      uploadFirestore(downurl,'${widget.desplace}', '${widget.expense}', '${widget.stay}','${widget.city}','${widget.username}','${widget.useremail}','${widget.userphone}','${widget.useraddress}',context);
// you can save the url as a text in you firebase store collection now
    }
    void SnakBar(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          )
      );
    }

    Future<void> uploadFirestore(String slipurl,String desplace,String expense,String stay,String city,String username,String  useremail,String userphone,String useraddress,BuildContext context)async {
      CollectionReference addtours = FirebaseFirestore.instance.collection('Bookedtour');

      addtours
          .add({
        'SlipUrl': slipurl, // John Doe
        'desplace': desplace, // Stokes and Sons
        'expense': expense ,
        'stay': stay ,
        'city': city, //
        'username': username,
        'useremail': useremail ,
        'useraddress': useraddress
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your Tour is Added"),
          )
      );
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: UniversalVariables.orangeColor,
        title: Text("Payment Method"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Spacer(),
                Container(
                  width: 180,
                  child: GestureDetector(
                    onTap: () async {
                      var openAppResult = await LaunchApp.openApp(
                        androidPackageName: 'pk.com.telenor.phoenix',
                        iosUrlScheme: 'pulsesecure://',
                        appStoreLink:
                        'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                        // openStore: false
                      );
                      print(
                          'openAppResult => $openAppResult ${openAppResult.runtimeType}');
                    //  launchWhatsApp();
                    },
                    child: Card(
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                width: 180,
                                child: Image.network("https://www.phoneworld.com.pk/wp-content/uploads/2022/05/IMG_2796-1.jpg")),
                            Text("Easy Paisa",style:  TextStyle(fontSize: 20),),
                          ],
                        )
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  child: GestureDetector(
                    onTap: () async{
                      var openAppResult = await LaunchApp.openApp(
                        androidPackageName: 'com.techlogix.mobilinkcustomer',
                        iosUrlScheme: 'pulsesecure://',
                        appStoreLink:
                        'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                        // openStore: false
                      );
                      print(
                          'openAppResult => $openAppResult ${openAppResult.runtimeType}');
                    },
                    child: Card(
                        child: Column(
                          children: [
                            Container(
                                height: 200,
                                width: 180,
                                child: Image.network("https://play-lh.googleusercontent.com/uNsO0CueIvfXSNf6R7WaGwdx6vsUDLjqTmdR0KO84ku7SR0teFBWdCenrngxJEVzM80=w600-h300-pc0xffffff-pd")),
                                Text("JazzCash",style:  TextStyle(fontSize: 20),),
                          ],
                        )
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              child: GestureDetector(
                onTap: () async{
                  var openAppResult = await LaunchApp.openApp(
                    androidPackageName: 'com.nayapay.app',
                    iosUrlScheme: 'pulsesecure://',
                    appStoreLink:
                    'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                    // openStore: false
                  );
                  print(
                      'openAppResult => $openAppResult ${openAppResult.runtimeType}');
                },

                child: Card(
                    child: Column(
                      children: [
                        Container(
                            height: 180,
                            child: Container(

                                child: Image.network("https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/de/e2/5e/dee25e03-a8e5-5696-e83f-a6295b618b91/AppIconFinal-1x_U007emarketing-0-6-0-sRGB-85-220.png/1200x630wa.png"))),
                        Text("Naya Pay",style:  TextStyle(fontSize: 20),),
                      ],
                    )
                ),
              ),
            ),
            GestureDetector(
              onTap: _openImagePicker,
              child: new Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 80,
                color: Colors.white,
                child: _image != null
                    ? Image.file(_image!,fit: BoxFit.cover,)
                    : const Text("Please Upload Pay Slip"),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:Color(0xff0EA89C),
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                maximumSize: const Size(200, 45),
                minimumSize: const Size(200, 45),
              ),
              child: const Text("Confirm Tour"),
              onPressed: (){sendData();},
            ),
          ],
        ),
      ),
    );
  }
}
