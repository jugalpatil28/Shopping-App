import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  Container buildPostCard() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            ),
            title: Text("Inprospect 😎"),
            subtitle: Text("12 Aug 2019 2:30 PM"),
          ),
          buildImageContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text("Post Main Heading"),
              subtitle: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            ),
          ),
          buildAttachmentsContainer(),
          Divider(
            thickness: 10.0,
          ),
        ],
      ),
    );
  }

  Container buildImageContainer() {
    return Container(
      child: Image.network(
        'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Container buildAttachmentsContainer() {
    return Container(
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "Attachments",
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildAttachments('assets/ppt.png'),
                  buildAttachments('assets/pdf.png'),
                  buildAttachments('assets/excel.png'),
                  buildAttachments('assets/doc.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildAttachments(String src) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Image.asset(
          src,
          height: 40,
          width: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return buildPostCard();
        },
      ),
    );
  }
}
