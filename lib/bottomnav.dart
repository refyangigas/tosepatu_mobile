import 'package:flutter/material.dart';
import 'package:tosepatu_mobile/profile.dart';
import 'dashboard.dart';
import 'status.dart';
import 'orders.dart';
import 'messages.dart';
import 'profile.dart';

class bottomnav extends StatefulWidget {
  @override
  _bottomnavState createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int currentTab = 0;
  final List<Widget> screens = [status(), ordersPage(), messages(), profile()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.auto_awesome_mosaic_rounded),
          backgroundColor: Colors.amber,
          onPressed: () {
            setState(() {
              currentScreen = dashboard();
              currentTab = 2;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 80,
                      onPressed: () {
                        setState(() {
                          currentScreen = status();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm_on,
                            color: currentTab == 0 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Status',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 115,
                      onPressed: () {
                        setState(() {
                          currentScreen = ordersPage();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_sharp,
                            color: currentTab == 1 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Orders',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 140,
                      onPressed: () {
                        setState(() {
                          currentScreen = messages();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.payment_sharp,
                            color: currentTab == 3 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Pembayaran',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = profile();
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline_sharp,
                            color: currentTab == 4 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                                color: currentTab == 4
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
