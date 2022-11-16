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
