import 'package:chat_sap/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
