import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final List<String> menuItems = [
    "timeline",
    "Prasar Seva",
    "Seva",
    "Sevekari Nodni",
    "Picture Gallery",
    "Book Aarati",
    "Change Language",
    "Notification Reference",
    "Share this App",
    "AboutUs"
  ];

  final List<IconData> menuItemIcons = [
    Icons.timeline,
    null,
    null,
    null,
    Icons.photo,
    null,
    null,
    null,
    Icons.share,
    Icons.error
  ];

  final List<String> navDrawer = [
    '/timeline',
    null,
    null,
    null,
    null,
    null,
    null,
    '/notification',
    null,
    '/meet',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            child: Text(
              "DRAWER HEADER..",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, navDrawer[index]);
                },
                leading: Icon(
                  menuItemIcons[index],
                  color: Colors.brown,
                ),
                title: Text(menuItems[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}
