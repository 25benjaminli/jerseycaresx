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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyApq9k-hKEpUtZ53-Kts_WWI0LhXcWbQ4A',
    appId: '1:565386552655:web:a7da27d935ff22dacfd13a',
    messagingSenderId: '565386552655',
    projectId: 'jersey-cares',
    authDomain: 'jersey-cares.firebaseapp.com',
    storageBucket: 'jersey-cares.appspot.com',
    measurementId: 'G-81GM1LLWVN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbnYZApXnbkOf_awCofUVjeKO4SXNHPoE',
    appId: '1:565386552655:android:ae4e237d156c25d7cfd13a',
    messagingSenderId: '565386552655',
    projectId: 'jersey-cares',
    storageBucket: 'jersey-cares.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8PFHnmElq2dcV7OR1ErUQtal4qT0WK4E',
    appId: '1:565386552655:ios:43e9769628e87079cfd13a',
    messagingSenderId: '565386552655',
    projectId: 'jersey-cares',
    storageBucket: 'jersey-cares.appspot.com',
    androidClientId: '565386552655-err4pp9i21micmg0i0tia8eksj0ol4q4.apps.googleusercontent.com',
    iosClientId: '565386552655-bohaede9tqjgpfji4urrquer702ehihd.apps.googleusercontent.com',
    iosBundleId: 'com.varsitydeveloper.jerseycares',
  );
}
