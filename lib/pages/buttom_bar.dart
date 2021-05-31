import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golekos/pages/dashboard_page.dart';
import 'package:golekos/pages/home_page.dart';
import 'package:golekos/pages/profile_page.dart';

class ButtomBar extends StatefulWidget {
  @override
  _ButtomBarState createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = [
    Dashboard(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: _onItemTapped,
        items: [
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/svg/Icon_home_solid.svg"),
            title: Text("HOME"),
            activeColor: Color(0xff2DC6F2),
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/svg/Icon_user_solid.svg"),
            title: Text("PROFILE"),
            activeColor: Color(0xff2DC6F2),
          ),
        ],
      ),
    );
  }
}
