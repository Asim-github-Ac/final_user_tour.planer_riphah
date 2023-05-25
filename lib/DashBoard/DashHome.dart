import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_tourist/DashBoard/CartPage.dart';
import 'package:user_tourist/DashBoard/MyOrderPage.dart';
import 'package:user_tourist/DashBoard/homepage.dart';
import 'package:user_tourist/utils/universal_variables.dart';


class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TabController _tabController;
  int pageIndex = 0;
  int _selectedDestination = 0;

  final pages = [
    HomePageContent(),
    CartPage(),
    MyOrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: UniversalVariables.whiteColor,
        appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: UniversalVariables.yellowColor,
            ),
            title: Text(
              "TRAVEL HERE",
              style: TextStyle(
                color: UniversalVariables.yellowColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 127, 106, 232)),
        body: pages[pageIndex],
        bottomNavigationBar: buildMyNavBar(context),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 232, 217),
                ),
                accountName: const Text(
                  "TRAVEL HERE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
                accountEmail: const Text(
                  "travelhere1322@gmail.com",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                currentAccountPicture: Image.asset(
                  "assets/images/logo.jpg",

                  //     //   //   // Text(
                  //     //   //   //   "M",
                  //     //   //   //   style: TextStyle(fontSize: 40.0),
                  //     //   //   // ),
                ),
              ),
              // )),
              // SizedBox(
              //   height: 100,
              //   child: Container(
              //     color: Color(0xffA9DDF3),
              //     child: Padding(
              //       padding: const EdgeInsets.all(12),
              //       child: Center(
              //         child: Text(
              //           "TRAVEL HERE",
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, color: Colors.black),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: Text('Home'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              ListTile(
                leading: Icon(Icons.tour),
                title: Text('Book Tour'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              ListTile(
                leading: Icon(Icons.local_hospital_outlined),
                title: Text('Tour Agencies'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              Divider(
                // color: Color.fromARGB(255, 140, 153, 201),
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Profile',
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Logout'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              Divider(
                //color: Color.fromARGB(255, 140, 153, 201),
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                //   // child: Text(
                //   //   'Profile',
                //   // ),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
                selected: _selectedDestination == 4,
                onTap: () => selectDestination(4),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              Divider(
                // color: Color.fromARGB(255, 140, 153, 201),
                height: 1,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Communication',
                ),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share'),
                selected: _selectedDestination == 5,
                onTap: () => selectDestination(5),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
              ListTile(
                leading: Icon(Icons.rate_review),
                title: Text('Rate Us'),
                selected: _selectedDestination == 6,
                onTap: () => selectDestination(6),
                selectedColor: Color.fromARGB(255, 127, 106, 232),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffFDC858),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? const Icon(
              Icons.home_filled,
              color: Color.fromARGB(255, 127, 106, 232),
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Color.fromARGB(209, 127, 106, 232),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? const Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 127, 106, 232),
              size: 35,
            )
                : const Icon(
              Icons.add_shopping_cart,
              color: Color.fromARGB(209, 127, 106, 232),
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? const Icon(
              Icons.tour_sharp,
              color: Color.fromARGB(255, 127, 106, 232),
              size: 35,
            )
                : const Icon(
              Icons.tour_outlined,
              color: Color.fromARGB(209, 127, 106, 232),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
