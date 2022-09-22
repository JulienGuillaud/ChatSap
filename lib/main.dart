import 'package:chat_sap/app_routes.dart';
import 'package:chat_sap/providers/providers.dart';
import 'package:chat_sap/screens/welcome/welcome_screen.dart';
import 'package:chat_sap/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   // init Firebase
//   Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   // run app
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // TEST YANO
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(
            firebaseAuth: FirebaseAuth.instance,
            googleSignIn: GoogleSignIn(),
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
        Provider<SettingProvider>(
          create: (_) => SettingProvider(
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
            firebaseStorage: this.firebaseStorage,
          ),
        ),
        Provider<HomeProvider>(
          create: (_) => HomeProvider(
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
        Provider<ChatProvider>(
          create: (_) => ChatProvider(
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
            firebaseStorage: this.firebaseStorage,
          ),
        ),
      ],
      child: MaterialApp(
          title: "ChatSap",
          theme: lightThemeData(context),
          home: SplashPage(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: kRoutes),
    );
  }
}
//       ],

//       child: MaterialApp(
//       title: 'ChatSap',
//       debugShowCheckedModeBanner: false,
//       theme: lightThemeData(context),
//       darkTheme: darkThemeData(context),
//       // home: WelcomeScreen(),
//       initialRoute: '/',
//       routes: kRoutes,
//     );
//   }
// }
