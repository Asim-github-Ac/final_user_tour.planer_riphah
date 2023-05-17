import 'dart:io';

import 'package:external_app_launcher/external_app_launcher.dart';
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


    launchWhatsApp() async {
      const url = 'whatsapp://send?phone=255634523';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("WhatsApp not installed")));
      }
  }
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
                    onTap: () {
                      launchWhatsApp();
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
                Spacer(),
              ],
            ),
            SizedBox(height: 15,),
            Container(
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
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
