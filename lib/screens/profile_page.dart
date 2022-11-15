import 'package:chat_sap/components/loading_view.dart';
import 'package:chat_sap/constants/constants.dart';
import 'package:chat_sap/constants/firestore_constants.dart';
import 'package:chat_sap/models/Contact.dart';
import 'package:chat_sap/providers/profile_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key, required this.userId}) : super(key: key);

  final String userId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ProfilePageState(userId:userId),
    );
  }
}

class ProfilePageState extends StatefulWidget {
  const ProfilePageState({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  State createState() => ProfilePageStateState();
}

class ProfilePageStateState extends State<ProfilePageState> {

  bool isLoading = false;
  late ProfileProvider profileProvider;

  final FocusNode focusNodeNickname = FocusNode();
  final FocusNode focusNodeAboutMe = FocusNode();

  @override
  void initState() {
    super.initState();
    profileProvider = context.read<ProfileProvider>();
    readLocal();
  }

  void readLocal() {
    setState(() {
      // id = profileProvider.getDataFirestore(FirestoreConstants.pathUserCollection, userId)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: StreamBuilder<QuerySnapshot>(
                        stream: profileProvider.getDataFirestore(
                            FirestoreConstants.pathUserCollection, widget.userId),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                              debugPrint('------------- snapshot.hasData :');
                            if ((snapshot.data?.docs.length ?? 0) > 0) {
                              debugPrint('------------- snapshot.hasData length :');
                              return ListView.builder(
                                padding: EdgeInsets.all(10),
                                itemBuilder: (context, index) => buildItem(
                                    context, snapshot.data?.docs[index]),
                                itemCount: snapshot.data?.docs.length,
                              );
                            } else {
                              return Center(
                                child: Text("Pas d'utilisateur"),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            );
                          }
                        },
                      ),
                      // Full screen height
                      height: MediaQuery.of(context).size.height,
              ),
            ],
          ),
          padding: EdgeInsets.only(left: 15, right: 15),
        ),

        // Loading
        Positioned(child: isLoading ? LoadingView() : SizedBox.shrink()),
      ],
    );
  }
  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
      debugPrint('------------- buildItem :');
      if (document != null) {
        Contact contact = Contact.fromDocument(document);
        debugPrint('------------- contact name :'+contact.username);
          return Column(
            children: [
              Container(
                    margin: EdgeInsets.all(20),
                    child: contact.photoUrl.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(45),
                                child: Image.network(
                                  contact.photoUrl,
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 90,
                                  errorBuilder: (context, object, stackTrace) {
                                    return Icon(
                                      Icons.account_circle,
                                      size: 90,
                                      color: kSecondaryColor,
                                    );
                                  },
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      width: 90,
                                      height: 90,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                          value:
                                              loadingProgress.expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Icon(
                                Icons.account_circle,
                                size: 90,
                                color: kSecondaryColor,
                              )
                  ),
              // Input
              Column(
                children: <Widget>[
                  // Username
                  Container(
                    child: Text(
                      'Nom',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    margin: EdgeInsets.only(left: 50, bottom: 5, top: 10),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: kPrimaryColor),
                      child: Text(
                        contact.username,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      )
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),

                  // About me
                  Container(
                    child: Text(
                      'About me',
                      style: TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    margin: EdgeInsets.only(left: 30, top: 30, bottom: 5),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: kPrimaryColor),
                      child: Text(
                        contact.aboutMe,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      )
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
          );
      }else{
        return Column(
          children: [
            Text(
              "Pas d'utilisateur aga",
            )
          ],
        );
      }
  }
}

            // Avatar
            //   