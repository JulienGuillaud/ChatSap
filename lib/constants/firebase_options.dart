import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDixgjIiIwY8MLV82P_UXY5fn5jbSYEi-Y',
    appId: '1:488746407188:web:e2dde35822a659bed65e01',
    messagingSenderId: '488746407188',
    projectId: 'chatsap-f65b5',
    authDomain: 'chatsap-f65b5.firebaseapp.com',
    databaseURL: 'https://chatsap-f65b5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatsap-f65b5.appspot.com',
    measurementId: 'G-H7J1SLEBD1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfceHAaKR7Cfb5vZDkPdWDYYc2hyGqj14',
    appId: '1:488746407188:android:da79944edaec7c0bd65e01',
    messagingSenderId: '488746407188',
    projectId: 'chatsap-f65b5',
    databaseURL: 'https://chatsap-f65b5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatsap-f65b5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpVPnj0C0sQgoqQfDhm7tFJ6y03XEvOX0',
    appId: '1:488746407188:ios:04d4d2a703722b79d65e01',
    messagingSenderId: '488746407188',
    projectId: 'chatsap-f65b5',
    databaseURL: 'https://chatsap-f65b5-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'chatsap-f65b5.appspot.com',
    androidClientId: '488746407188-c9m1dhqvggsap6d0ogmgk5b2p1d7t08l.apps.googleusercontent.com',
    iosClientId: '488746407188-057al6n4l1tu0g42binfffo5n0ok6rqi.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );
}
