import 'package:chat_sap/models/Contact.dart';
import 'package:flutter/foundation.dart';

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final Contact contact;
  final String text;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isSender;

  ChatMessage({
    required this.contact,
    this.text = '',
    required this.messageType,
    required this.messageStatus,
    required this.isSender,
  });
}

getMessages(_contact) {
  debugPrint('oldList: $demeChatMessages');
  debugPrint('Filter by :$_contact');
  List outputList =
      demeChatMessages.where((o) => o.contact == _contact).toList();
  debugPrint('newList: $outputList');
  return outputList;
}

List demeChatMessages = [
  ChatMessage(
    contact: Contact.findContact(1),
    text: "Salut ça va,",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "Oue et toi ?",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "",
    messageType: ChatMessageType.audio,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "",
    messageType: ChatMessageType.video,
    messageStatus: MessageStatus.viewed,
    isSender: true,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "Ya r",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_sent,
    isSender: true,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "Ah mince",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.viewed,
    isSender: false,
  ),
  ChatMessage(
    contact: Contact.findContact(1),
    text: "bla bla",
    messageType: ChatMessageType.text,
    messageStatus: MessageStatus.not_view,
    isSender: true,
  ),
];
