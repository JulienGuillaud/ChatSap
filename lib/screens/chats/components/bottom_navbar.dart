import 'package:chat_sap/app_routes.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  CustomBottomNavBar(this.index);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (indexCible) {
        switch (indexCible) {
          case 0:
            Navigator.pushReplacementNamed(context, kChatsRoute);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, kProfileRoute);
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        // BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        // BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_3.png"),
          ),
          label: "Profil",
        ),
      ],
    );
  }
}
