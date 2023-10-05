// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
        return macos;
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
    apiKey: 'AIzaSyA7yOdx09ECsw_P21p0NxyXZ56wvmKhv6Q',
    appId: '1:290074510635:web:1a49a5286548cfff7e316e',
    messagingSenderId: '290074510635',
    projectId: 'notesonfirebase-515f4',
    authDomain: 'notesonfirebase-515f4.firebaseapp.com',
    storageBucket: 'notesonfirebase-515f4.appspot.com',
    measurementId: 'G-RKTYH9DTLJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3RtXvOlGVaPOS7TKauVNBaCkg4x2NwW4',
    appId: '1:290074510635:android:8040ac064a0c359b7e316e',
    messagingSenderId: '290074510635',
    projectId: 'notesonfirebase-515f4',
    storageBucket: 'notesonfirebase-515f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlrRnT5Qq7Xz5BALaL3Dm1ffikOz5CxIM',
    appId: '1:290074510635:ios:4d974e3628b096517e316e',
    messagingSenderId: '290074510635',
    projectId: 'notesonfirebase-515f4',
    storageBucket: 'notesonfirebase-515f4.appspot.com',
    iosBundleId: 'com.example.notesAppOnFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlrRnT5Qq7Xz5BALaL3Dm1ffikOz5CxIM',
    appId: '1:290074510635:ios:65a3a1d770edf7507e316e',
    messagingSenderId: '290074510635',
    projectId: 'notesonfirebase-515f4',
    storageBucket: 'notesonfirebase-515f4.appspot.com',
    iosBundleId: 'com.example.notesAppOnFirebase.RunnerTests',
  );
}
