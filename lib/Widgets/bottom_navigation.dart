import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.orange,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            icon: Icon(Icons.home, color: Colors.brown),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.brown),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.archive, color: Colors.brown), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.event_note, color: Colors.brown), title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.brown),
            title: Text(''))
      ],
    );
  }
}
