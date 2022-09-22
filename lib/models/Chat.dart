import 'Contact.dart';

class Chat {
  final String name, lastMessage, time;
  Contact contact;
  final bool isActive;

  Chat({
    required this.contact,
    this.name = '',
    this.lastMessage = '',
    this.time = '',
    this.isActive = false,
  });
}

// List chatsData = [
//   Chat(
//     contact: Contact.findContact(1),
//     lastMessage: "Mets toi au go",
//     time: "3m ago",
//     isActive: false,
//   ),
//   Chat(
//     contact: Contact.findContact(2),
//     lastMessage: "Gros tfq",
//     time: "8m ago",
//     isActive: true,
//   ),
// ];
