import 'package:chat_sap/components/primary_button.dart';
import 'package:chat_sap/constants.dart';
import 'package:chat_sap/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                "assets/images/Logo.png",
                height: 146,
              ),
              Spacer(),
              PrimaryButton(
                text: "Connection",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding * 1.5),
              PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Insription",
                press: () {},
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
