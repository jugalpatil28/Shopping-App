import 'package:devasthan_flutter_app/Widgets/bottom_navigation.dart';
import 'package:devasthan_flutter_app/Widgets/image_container.dart';
import 'package:devasthan_flutter_app/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Container buildBottomContainer(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: buildCard(Icons.import_contacts, "Read", '/read'),
                ),
                Expanded(
                  child: buildCard(Icons.ondemand_video, "Watch", '/watch'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: buildCard(Icons.queue_music, "Listen", '/listen'),
                ),
                Expanded(
                  child: buildCard(Icons.location_on, "Meet", '/meet'),
                ),
              ],
            ),
            buildDropDown(context),
          ],
        ),
      ),
    );
  }

  Container buildDropDown(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 35,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(color: Colors.brown, width: 2),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.brown,
              ),
              onChanged: (dynamic) {},
              hint: Text("Daily Program"),
              items: <DropdownMenuItem>[],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(IconData iconData, String title, String navigationRoute) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, navigationRoute),
      child: Card(
        elevation: 6,
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: ListTile(
            leading: Icon(iconData, color: Colors.brown),
            title: Text(
              title,
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.notifications, color: Colors.brown),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: ImageContainer(),
            ),
            Expanded(
              flex: 1,
              child: buildBottomContainer(context),
            ),
          ],
        ),
      ),
    );
  }
}
