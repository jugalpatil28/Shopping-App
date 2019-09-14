import 'package:devasthan_flutter_app/Activities/HomePage/listen.dart';
import 'package:devasthan_flutter_app/Activities/HomePage/meet.dart';
import 'package:devasthan_flutter_app/Activities/HomePage/watch.dart';
import 'package:devasthan_flutter_app/Activities/authentication.dart';
import 'package:devasthan_flutter_app/Activities/notifications.dart';
import 'package:devasthan_flutter_app/StateRebuilder/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'Activities/HomePage/homepage.dart';
import 'Activities/HomePage/read.dart';
import 'Activities/Timeline.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => StateBuilder(
              blocs: [mainBloc],
              tag: 'auth',
              builder: (BuildContext context, String tagID) {
                return mainBloc.authenticateUser == null ? Auth() : HomePage();
              },
            ),
        '/homepage': (BuildContext context) => HomePage(),
        '/meet': (BuildContext context) => Meet(),
        '/notification': (BuildContext context) => NotificationReference(),
        '/read': (BuildContext context) => Read(),
        '/watch': (BuildContext context) => Watch(),
        '/listen': (BuildContext context) => Listen(),
        '/timeline': (BuildContext context) => Timeline(),
      },
    );
  }

  @override
  void initState() {
    super.initState();
    mainBloc.autoAuthenticate();
  }
}
