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
    apiKey: 'AIzaSyC32wxzWruCprSP24snMFqla1rU0ir1Hxg',
    appId: '1:908690921148:web:b33cd4b989bc4e686b62b9',
    messagingSenderId: '908690921148',
    projectId: 'gooogle-eeb52',
    authDomain: 'gooogle-eeb52.firebaseapp.com',
    storageBucket: 'gooogle-eeb52.appspot.com',
    measurementId: 'G-ZJGP2R828T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCtJci0KgEK1JRZyAfMw98ZqUBTsJfTns',
    appId: '1:908690921148:android:2f56355fb6dc95576b62b9',
    messagingSenderId: '908690921148',
    projectId: 'gooogle-eeb52',
    storageBucket: 'gooogle-eeb52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4J0n_zktPUXXEv8yDWFNhLJBG4tsMsu0',
    appId: '1:908690921148:ios:498171379aa44ca46b62b9',
    messagingSenderId: '908690921148',
    projectId: 'gooogle-eeb52',
    storageBucket: 'gooogle-eeb52.appspot.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4J0n_zktPUXXEv8yDWFNhLJBG4tsMsu0',
    appId: '1:908690921148:ios:afba400f6ab536b06b62b9',
    messagingSenderId: '908690921148',
    projectId: 'gooogle-eeb52',
    storageBucket: 'gooogle-eeb52.appspot.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}
