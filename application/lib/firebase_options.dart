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
    apiKey: 'AIzaSyD-FcDcZjnTyYnHz7hebaojB_GL2ZmqBSE',
    appId: '1:777793975330:web:f00b2872728e179c79067b',
    messagingSenderId: '777793975330',
    projectId: 'desafio-smash',
    authDomain: 'desafio-smash.firebaseapp.com',
    storageBucket: 'desafio-smash.appspot.com',
    measurementId: 'G-MS75W7EBTJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDc9v3IoPWsNmp6kwl4aGrlU3VzfD0RqiE',
    appId: '1:777793975330:android:9918883a0aaa241a79067b',
    messagingSenderId: '777793975330',
    projectId: 'desafio-smash',
    storageBucket: 'desafio-smash.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbmX6DLOVedludMVz-oe7NFIfA8QjEWMw',
    appId: '1:777793975330:ios:f2acfd1779e58c8279067b',
    messagingSenderId: '777793975330',
    projectId: 'desafio-smash',
    storageBucket: 'desafio-smash.appspot.com',
    iosClientId: '777793975330-t8oic07umav3r7co8s39k51vfijufd1h.apps.googleusercontent.com',
    iosBundleId: 'com.example.smash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbmX6DLOVedludMVz-oe7NFIfA8QjEWMw',
    appId: '1:777793975330:ios:f2acfd1779e58c8279067b',
    messagingSenderId: '777793975330',
    projectId: 'desafio-smash',
    storageBucket: 'desafio-smash.appspot.com',
    iosClientId: '777793975330-t8oic07umav3r7co8s39k51vfijufd1h.apps.googleusercontent.com',
    iosBundleId: 'com.example.smash',
  );
}
