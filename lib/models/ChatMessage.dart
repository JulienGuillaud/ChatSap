import 'package:chat_sap/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  String from;
  String to;
  String text;
  MessageStatus messageStatus;
  String timestamp;

  ChatMessage({
    required this.from,
    required this.to,
    required this.text,
    required this.timestamp,
    required this.messageStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      FirestoreConstants.from: this.from,
      FirestoreConstants.to: this.to,
      FirestoreConstants.timestamp: this.timestamp,
      FirestoreConstants.text: this.text,
    };
  }

  factory ChatMessage.fromDocument(DocumentSnapshot doc) {
    String from = doc.get(FirestoreConstants.from);
    String to = doc.get(FirestoreConstants.to);
    String timestamp = doc.get(FirestoreConstants.timestamp);
    String content = doc.get(FirestoreConstants.text);
    return ChatMessage(
        from: from,
        to: to,
        timestamp: timestamp,
        text: content,
        messageStatus: MessageStatus.not_sent);
  }
}
