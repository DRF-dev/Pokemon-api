import 'package:flutter/material.dart';
import 'package:pokemon/views/details/widgets/image.widget.dart';

class Details extends StatelessWidget {
  static const route = '/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DetailImage(),
          Column(
            children: <Widget>[
              Text("data"),
            ],
          ),
        ],
      ),
    );
  }
}
