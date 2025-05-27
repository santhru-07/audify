import 'package:audify/homepage.dart';
import 'package:audify/splash%20screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int _currentIndexs = 0;

  final screen = [SplashScreen(), HomePage()];
conditions(String?text){
return Container();
}
conditions2({int?number}){
  return Container();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[_currentIndexs],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndexs,
        items: <BottomNavyBarItem>[
          conditions("nvinivnrini"),
          conditions2(number: 44877),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue),
        ],
        onItemSelected: (value) {
          setState(() {
            _currentIndexs = value;
          });
        },
      ),
    );
  }
}
