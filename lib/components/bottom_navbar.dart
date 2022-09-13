import 'package:chat_sap/screens/chats/chats_screen.dart';
import 'package:chat_sap/screens/chats/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  CustomBottomNavBar(this.index);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (indexCible) {
        if (indexCible != index) {
          switch (indexCible) {
            case 0:
              // Navigator.pushReplacementNamed(context, kChatsRoute);
              Navigator.push(
                context,
                PageTransition(
                  type: (index == 0)
                      ? PageTransitionType.rightToLeft
                      : PageTransitionType.leftToRight,
                  child: ChatsScreen(),
                ),
              );
              break;
            case 1:
              // Navigator.pushReplacementNamed(context, kProfileRoute);
              Navigator.push(
                context,
                PageTransition(
                  type: (index == 0)
                      ? PageTransitionType.rightToLeft
                      : PageTransitionType.leftToRight,
                  child: ProfileScreen(),
                ),
              );
              break;
          }
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
