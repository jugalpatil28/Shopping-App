import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(
            "https://reactnativecode.com/wp-content/uploads/2018/02/Default_Image_Thumbnail.png"),
      ),
    );
  }
}
