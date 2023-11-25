import 'package:flutter/material.dart';
import 'package:tugas_besar/screens/home.dart';
import 'package:tugas_besar/screens/profile.dart';
import 'package:tugas_besar/screens/home2.dart';
import 'package:tugas_besar/screens/home3.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final screens = [
    ToyotaPage(),
    NissanPage(),
    AudiPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.car_repair), label: 'Toyota'),
          BottomNavigationBarItem(icon: Icon(Icons.car_repair), label: 'Honda'),
          BottomNavigationBarItem(icon: Icon(Icons.car_repair), label: 'Audi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
