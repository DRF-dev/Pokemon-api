import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      color: Colors.green,
      child: Image.network(
        "https://pokeres.bastionbot.org/images/pokemon/2.png",
      ),
    );
  }
}
