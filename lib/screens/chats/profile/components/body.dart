import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: Text(
          "Profile",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    ]);
  }
}
