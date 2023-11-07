import 'package:flutter/material.dart';

import '../utils/AppWidget.dart';
import '../utils/T5BubbleBotoomBar.dart';
import '../utils/T5Colors.dart';
import '../utils/T5Images.dart';
import '../utils/T5Strings.dart';
import '../utils/T5Widget.dart';

class DemoT5BottomNavigation extends StatefulWidget {
  static var tag = "/DemoT5BottomNavigation";

  @override
  DemoT5BottomNavigationState createState() => DemoT5BottomNavigationState();
}

class DemoT5BottomNavigationState extends State<DemoT5BottomNavigation> {
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);

    return Scaffold(
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        backgroundColor: appStore.appBarColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: changePage,
        hasNotch: false,
        hasInk: true,
        inkColor: t5ColorPrimaryLight,
        items: <BubbleBottomBarItem>[
          tab(t5_img_home, t5_home),
          tab(t5_list_check, t5_lbl_listing),
          tab(t5_notification_2, t5_notification),
          tab(t5_user, t5_lbl_profile),
        ],
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: ring(t5_lbl_welcome_to_bottom_n_navigation_bar),
          ),
          TopBar()
        ],
      ),
    );
  }
}
