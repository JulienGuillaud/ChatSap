import 'package:chat_sap/constants.dart';
import 'package:chat_sap/models/ChatMessage.dart';
import 'package:chat_sap/models/Contact.dart';
import 'package:flutter/material.dart';

import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  Body(this.contact);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    List messages = getMessages(contact);

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) =>
                  Message(message: messages[index]),
            ),
          ),
        ),
        ChatInputField(),
      ],
    );
  }
}
