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

  final pages = [
     HomePageContent(),
     CartPage(),
     MyOrderPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  UniversalVariables.whiteColor,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: UniversalVariables.orangeColor,
        ),
        title: Text(
          "Tourist App",
          style: TextStyle(
            color:  UniversalVariables.orangeColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: UniversalVariables.orangeColor,
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
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.home_outlined,
              color: Colors.white,
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
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
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
              Icons.reorder,
              color: Colors.white,
              size: 35,
            )
                : const Icon(
              Icons.reorder,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
