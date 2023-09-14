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
    apiKey: 'AIzaSyD_VS7aunC-mdEmeIEPk4KKzbWAFKyBpTk',
    appId: '1:304788372715:web:dbb23873d268fdc1c0d2ae',
    messagingSenderId: '304788372715',
    projectId: 'movie-app-9e27c',
    authDomain: 'movie-app-9e27c.firebaseapp.com',
    storageBucket: 'movie-app-9e27c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMmemeAdQTzBDHxVTbnjBvtkPLHbBRRlg',
    appId: '1:304788372715:android:0e36aca1a14cffa1c0d2ae',
    messagingSenderId: '304788372715',
    projectId: 'movie-app-9e27c',
    storageBucket: 'movie-app-9e27c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkDNvrdJKV_2Q3q1xLekhmcy8mwNx9WTs',
    appId: '1:304788372715:ios:94c24bacfaa089aec0d2ae',
    messagingSenderId: '304788372715',
    projectId: 'movie-app-9e27c',
    storageBucket: 'movie-app-9e27c.appspot.com',
    iosBundleId: 'com.example.movieApp',
  );
}