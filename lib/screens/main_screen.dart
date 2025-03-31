import 'package:chat_app_mobile/screens/calls/call_screen.dart';
import 'package:chat_app_mobile/screens/contact_screen.dart';
import 'package:chat_app_mobile/screens/setting_screen.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CallScreen(),
    ContactScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined
                ), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.call), label: "Calls"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2), label: "Contacts"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: "Settings"),
          ]),
      body: _screens.elementAt(_currentIndex),
    );
  }
}
