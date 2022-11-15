import 'package:chat_sap/constants/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ProfileProvider({
    required this.prefs,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });


  Stream<QuerySnapshot> getDataFirestore(
      String collectionPath, String userId) {
    return firebaseFirestore
        .collection(collectionPath)
        .limit(1)
        .where(FirestoreConstants.id, isEqualTo: userId)
        .snapshots();
  }
}
