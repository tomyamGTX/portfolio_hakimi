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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDawhAuDD5hvGc9u-9Gj4rfKh-_gCHXjIA',
    appId: '1:562408540515:web:6aabd229eabd49b871ab56',
    messagingSenderId: '562408540515',
    projectId: 'portfoliohakimi-b90b8',
    authDomain: 'portfoliohakimi-b90b8.firebaseapp.com',
    storageBucket: 'portfoliohakimi-b90b8.appspot.com',
    measurementId: 'G-0FRCCZY4JV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDABiLHHxjcgiy8VGOKY_HuwFHHMu7LC8',
    appId: '1:562408540515:android:08edae9bfe35974e71ab56',
    messagingSenderId: '562408540515',
    projectId: 'portfoliohakimi-b90b8',
    storageBucket: 'portfoliohakimi-b90b8.appspot.com',
  );
}