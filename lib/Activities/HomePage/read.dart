import 'package:devasthan_flutter_app/StateRebuilder/main_bloc.dart';
import 'package:devasthan_flutter_app/Widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Read extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      drawer: NavigationDrawer(),
      body: StateBuilder(
        blocs: [mainBloc],
        tag: 'readTitles',
        builder: (BuildContext context, String tagID) {
          return ListView.builder(
            itemCount: mainBloc.readTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCard(mainBloc.readTitles[index]);
            },
          );
        },
      ),
    );
  }

  Card buildCard(String text) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.brown,
        ),
      ),
    );
  }
}
