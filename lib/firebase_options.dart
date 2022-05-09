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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp-_wAL8KgYXcTOOH-j0FmRKCFqpLsrLM',
    appId: '1:428521027018:android:326c4fb64d5d46edd90b33',
    messagingSenderId: '428521027018',
    projectId: 'bf-gone-birding-6ace8',
    storageBucket: 'bf-gone-birding-6ace8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDigxmGkXz2NpWNW6lvB39UV0cPgl5rKcQ',
    appId: '1:428521027018:ios:a19d8fa9c1ea597ad90b33',
    messagingSenderId: '428521027018',
    projectId: 'bf-gone-birding-6ace8',
    storageBucket: 'bf-gone-birding-6ace8.appspot.com',
    iosClientId: '428521027018-savvqrq6ak8psmdkmoqegu227va1bmjg.apps.googleusercontent.com',
    iosBundleId: 'com.bluefulmar.bfGoneBirding',
  );
}