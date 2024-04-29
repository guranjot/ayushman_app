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
        return windows;
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
    apiKey: 'AIzaSyC7Mn-980JMPfAQML2aEKPA_ixfkUEBMDk',
    appId: '1:873229119195:web:5d47284f2479da5a7766fe',
    messagingSenderId: '873229119195',
    projectId: 'phone-otp-bcfab',
    authDomain: 'phone-otp-bcfab.firebaseapp.com',
    storageBucket: 'phone-otp-bcfab.appspot.com',
    measurementId: 'G-L0FNLP82DM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEalXejjL6Y9hzQNt9Tfy9S4lvAIY1GHU',
    appId: '1:873229119195:android:4087e97d7e9348a27766fe',
    messagingSenderId: '873229119195',
    projectId: 'phone-otp-bcfab',
    storageBucket: 'phone-otp-bcfab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMVsMchHYehit4shVsgg9EguZ3c0nus2k',
    appId: '1:873229119195:ios:94aa709157778b217766fe',
    messagingSenderId: '873229119195',
    projectId: 'phone-otp-bcfab',
    storageBucket: 'phone-otp-bcfab.appspot.com',
    iosBundleId: 'com.example.ayurvedicAyushman',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMVsMchHYehit4shVsgg9EguZ3c0nus2k',
    appId: '1:873229119195:ios:94aa709157778b217766fe',
    messagingSenderId: '873229119195',
    projectId: 'phone-otp-bcfab',
    storageBucket: 'phone-otp-bcfab.appspot.com',
    iosBundleId: 'com.example.ayurvedicAyushman',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7Mn-980JMPfAQML2aEKPA_ixfkUEBMDk',
    appId: '1:873229119195:web:36dcd956ad4871167766fe',
    messagingSenderId: '873229119195',
    projectId: 'phone-otp-bcfab',
    authDomain: 'phone-otp-bcfab.firebaseapp.com',
    storageBucket: 'phone-otp-bcfab.appspot.com',
    measurementId: 'G-WYYH1TLR28',
  );

}