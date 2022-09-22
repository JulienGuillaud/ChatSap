import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //   child: ListView.builder(
        //     itemCount: chatsData.length,
        //     itemBuilder: (context, index) => ChatCard(
        //       chat: chatsData[index],
        //       press: () => Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => HomePage(chatsData[index].contact),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
