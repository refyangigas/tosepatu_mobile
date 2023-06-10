import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tosepatu_mobile/dashboard.dart';
import 'package:tosepatu_mobile/messages.dart';
import 'package:tosepatu_mobile/orders.dart';
import 'package:tosepatu_mobile/profile.dart';
import 'package:tosepatu_mobile/status.dart';

class bottomnav extends StatefulWidget {
  final int currentTab;

  const bottomnav({Key? key, required this.currentTab}) : super(key: key);

  @override
  _bottomnavState createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  late int currentTab;
  final List<Widget> screens = [
    status(),
    ordersPage(),
    messages(),
    profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentTab = widget.currentTab;
    currentScreen = screens[currentTab];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBarHeight = AppBar().preferredSize.height;
    final bottomNavBarHeight = mediaQuery.size.height * 0.08;

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
          height: bottomNavBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: mediaQuery.size.width / 3.6,
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
                            color: currentTab == 0 ? Colors.amber : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: mediaQuery.size.width / 6,
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
                            color: currentTab == 1 ? Colors.amber : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: mediaQuery.size.width / 4.9,
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
                            color: currentTab == 3 ? Colors.amber : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: mediaQuery.size.width / 4.9,
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
                            color: currentTab == 4 ? Colors.amber : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
