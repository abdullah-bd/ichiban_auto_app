// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDV8rZJKUrfryVtXDsLhnfcZb1KOj2V54I',
    appId: '1:1085089685179:android:f4a55dd4c31761abca139e',
    messagingSenderId: '1085089685179',
    projectId: 'ichiban-auto-app',
    databaseURL: 'https://ichiban-auto-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ichiban-auto-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjhfm_AHqs_z6KLqo0W293hyrTCdj3WrM',
    appId: '1:1085089685179:ios:5101ace87888b5d7ca139e',
    messagingSenderId: '1085089685179',
    projectId: 'ichiban-auto-app',
    databaseURL: 'https://ichiban-auto-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ichiban-auto-app.appspot.com',
    iosBundleId: 'nz.co.ichibanauto.ichibanAuto',
  );
}