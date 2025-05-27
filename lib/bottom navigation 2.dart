import 'package:audify/homepage.dart';
import 'package:audify/splash%20screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Bottomscreen2 extends StatefulWidget {
  const Bottomscreen2({super.key});
  @override
  State<Bottomscreen2> createState() => _Bottomscreen2State();
}

class _Bottomscreen2State extends State<Bottomscreen2> {
  int _currentindexes = 0;

  final screen = [SplashScreen(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screen[_currentindexes],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentindexes,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
          ],
          onItemSelected: (value) {
            setState(()  {
          _currentindexes = value;
            });
          },
        ));
  }
}
