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
    apiKey: 'AIzaSyDyVOOCSPYWYAsorROkuCq7wF5HZuibr3w',
    appId: '1:954316802537:android:e2abd9a7db887a36dda378',
    messagingSenderId: '954316802537',
    projectId: 'chetam-777',
    storageBucket: 'chetam-777.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_BVz9N68rqQ04cvRX0pSS4kToVciqVzg',
    appId: '1:954316802537:ios:8bf94ec449f3b281dda378',
    messagingSenderId: '954316802537',
    projectId: 'chetam-777',
    storageBucket: 'chetam-777.appspot.com',
    androidClientId: '954316802537-1vq9j1sncca7dh09msqbuhlfir76bbsu.apps.googleusercontent.com',
    iosClientId: '954316802537-dar9ob2vevpdb9ri240ivnhqfbiadl7f.apps.googleusercontent.com',
    iosBundleId: 'com.krmeiirbek.chetam',
  );
}
