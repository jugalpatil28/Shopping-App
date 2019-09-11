import 'package:devasthan_flutter_app/Widgets/bottom_navigation.dart';
import 'package:devasthan_flutter_app/Widgets/image_container.dart';
import 'package:devasthan_flutter_app/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class Meet extends StatelessWidget {
  final String address1 = "Shri Dattadevstan trust,";
  final String address2 = "vedantnagar,manmad road,";
  final String address3 = "Ahmednagar-414003";
  final String contact1 = "02421-2423585/";
  final String contact2 = "02421-2424785";

  Container buildAboutUsContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Shri Datta Devstan",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.brown),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildAddressContainer(),
          Divider(
            color: Colors.brown,
            height: 15,
            endIndent: 20,
            indent: 20,
          ),
          buildContactContainer(),
          Divider(
            color: Colors.brown,
            height: 15,
          ),
        ],
      ),
    );
  }

  Container buildContactContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.ring_volume,
              size: 40,
              color: Colors.brown,
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  contact1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  contact2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 1,
          ),
        ],
      ),
    );
  }

  Container buildAddressContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.location_on,
              size: 40,
              color: Colors.brown,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: <Widget>[
              Text(
                address1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                address2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                address3,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: NavigationDrawer(),
//      bottomNavigationBar: new BottomNavigation(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
              child: buildAboutUsContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
