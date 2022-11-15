import 'package:chat_sap/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  final String id, username, photoUrl, aboutMe;

  Contact({
    this.id = "",
    this.username = "",
    this.photoUrl = "",
    this.aboutMe = "",
  });

  // static Contact findContact(id) {
  //   return contactData.firstWhere((o) => o.contactId == id);
  // }

  Map<String, String> toJson() {
    return {
      FirestoreConstants.username: username,
      FirestoreConstants.aboutMe: aboutMe,
      FirestoreConstants.photoUrl: photoUrl,
    };
  }

  factory Contact.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutMe);
    } catch (e) {}
    try {
      photoUrl = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    try {
      nickname = doc.get(FirestoreConstants.username);
    } catch (e) {}
    return Contact(
      id: doc.id,
      photoUrl: photoUrl,
      username: nickname,
      aboutMe: aboutMe,
    );
  }
}
