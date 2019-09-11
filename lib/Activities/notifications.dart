import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationReference extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationReferenceState();
  }
}

class _NotificationReferenceState extends State<NotificationReference> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SwitchListTile(
            onChanged: (value) {
              setState(() {
                this.value = !this.value;
              });
            },
            value: value,
            title: Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.brown,
            indent: 10,
            endIndent: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Notify About Me :",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  dense: true,
                  value: value,
                  onChanged: (bool value) {},
                  title: Text(
                    "New Videos",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                CheckboxListTile(
                  dense: true,
                  value: value,
                  onChanged: (bool value) {},
                  title: Text(
                    "New Videos",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                CheckboxListTile(
                  dense: true,
                  value: value,
                  onChanged: (bool value) {},
                  title: Text(
                    "New Videos",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
