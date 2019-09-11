import 'package:flutter/material.dart';

class AllPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card();
        },
      ),
    );
  }
}
