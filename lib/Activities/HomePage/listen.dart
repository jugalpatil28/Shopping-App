import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:devasthan_flutter_app/StateRebuilder/main_bloc.dart';

class Listen extends StatelessWidget {
  Card buildCard(String text) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StateBuilder(
        tag: 'listenTitles',
        blocs: [mainBloc],
        builder: (BuildContext context, String tagID) {
          return ListView.builder(
            itemCount: mainBloc.listenTitles.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCard(mainBloc.listenTitles[index]);
            },
          );
        },
      ),
    );
  }
}
