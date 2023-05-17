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


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/DashBoard/DetailsTours.dart';
import 'package:user_tourist/utils/universal_variables.dart';

import 'CartPage.dart';
import 'MyOrderPage.dart';

class HomePageContent extends StatefulWidget {


  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String name= "";
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Tours').where("placename",isGreaterThanOrEqualTo: name.toString()).snapshots();
    return Scaffold(

                appBar: AppBar(
                  backgroundColor:UniversalVariables.orangeColor,
                  title: Card(
                child: TextField(
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText:'Search here',
                ),
                onChanged: (val){
                setState(() {
                name=val;
                });
                },
                ),
                ),),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Tours').where("placename",isGreaterThanOrEqualTo: name.toString()).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }


            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Card(
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  child: ListTile(
                    title: Column(
                      children: [
                        Container(
                            height: 200,
                            width: 200,
                            child: Image.network(data['url'])),
                        SizedBox(height: 10,),
                        Row(children: [Text("Place Name: ",style: TextStyle(color: Colors.blue,fontSize: 20),),Text(data['placename'])],)
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Row(children: [Text("Place Des: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['desplace'])],),
                        Row(children: [Text("Place Date: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['date'])],),
                        Row(children: [Text("Place Stay: ",style: TextStyle(color: Colors.blue,fontSize: 18),),Text(data['stay'])],),
                        new SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary:UniversalVariables.orangeColor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            maximumSize: const Size(200, 45),
                            minimumSize: const Size(200, 45),
                          ),
                          child: const Text("More Details"),
                          onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsTours(url:data['url'],place: data['placename'],desplace: data['desplace'],expense: data['expense'],date: data['date'],stay: data['stay'],city: data['city'],)));},
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                );
              }).toList(),

          );
        },
      ),
    );

  }
  }
//   createDrawer(){
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.all(0.0),
//         children: <Widget>[
//           DrawerHeader(
//             child: UserAccountsDrawerHeader(
//               decoration: BoxDecoration(color: Colors.white,),
//               accountName:Text("Adeena") ,
//               accountEmail: Text("Addena@gmail.com"),
//               currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/eggs-breakfast-avocado-1296x728-header.jpg?w=1155&h=1528")),
//             ),
//             decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: Colors.transparent,
//             ),
//           ),
//           ListTile(
//             trailing: Icon(Icons.arrow_forward_ios,),
//             leading: Icon(Icons.home,color: Colors.orangeAccent,),
//             title: Text('Home',),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             trailing: Icon(Icons.arrow_forward_ios,),
//             leading: Icon(Icons.shopping_basket,color: Colors.orangeAccent,),
//             title: Text('Cart'),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
//             },
//           ),
//           ListTile(
//             trailing: Icon(Icons.arrow_forward_ios,),
//             leading: Icon(Icons.fastfood,color: Colors.orangeAccent,),
//             title: Text('My Order'),
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrderPage()));
//             },
//           ),
//           ListTile(
//             trailing: Icon(Icons.arrow_forward_ios,),
//             leading: Icon(Icons.clear,color: Colors.orangeAccent,),
//             title: Text('Logout'),
//             onTap: () async {
//               // final AuthMethods _authMethods = AuthMethods();
//               //  await _authMethods.logout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//   createSearchBar(){
//        return  Container(
//          height: MediaQuery.of(context).size.height*0.08,
//          child: Stack(
//            children: <Widget>[
//              // Replace this container with your Map widget
//              Container(
//                decoration: BoxDecoration(
//                  color: Colors.orange,
//                  borderRadius: BorderRadius.only(
//                    bottomRight:Radius.circular(20.0),
//                    bottomLeft: Radius.circular(20.0),
//                  ),
//                ),
//              ),
//              Positioned(
//                top: 10,
//                right: 15,
//                left: 15,
//                child: GestureDetector(
//               //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage())),
//                  child: Container(
//                    decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.all(Radius.circular(10.0))
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Padding(
//                            padding: const EdgeInsets.only(left:18.0),
//                            child: Text("Search",style: TextStyle(color: Colors.black45),),
//                          )
//                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(right: 8.0),
//                          child: IconButton(icon: Icon(Icons.search,color: Colors.orange,), onPressed: null)
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        );
//      }
//
// }
//
//
