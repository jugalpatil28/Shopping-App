import 'package:devasthan_flutter_app/StateRebuilder/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: StateBuilder(
        tag: 'watchList',
        blocs: [mainBloc],
        builder: (BuildContext context, String tagID) {
          return ListView.builder(
            itemCount: mainBloc.watchList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: null),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          mainBloc.watchList[index]['title'],
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          mainBloc.watchList[index]['part'],
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          mainBloc.watchList[index]['author'],
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          mainBloc.watchList[index]['date'],
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
