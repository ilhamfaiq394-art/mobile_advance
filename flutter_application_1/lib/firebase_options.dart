// File: lib/firebase_options.dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCSbSYHSWYFTxLsma56Zd35FdaikHRD7M4',
    appId: '1:53256422637:web:8a0f7a5d2274f9186ff8e4',
    messagingSenderId: '53256422637',
    projectId: 'mobile-application-e0da4',
    authDomain: 'mobile-application-e0da4.firebaseapp.com',
    storageBucket: 'mobile-application-e0da4.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwevwIQi40bPUThpij3ZgiCrXr8qzVazY',
    appId: '1:53256422637:android:07c2ecf5d30f165a6ff8e4',
    messagingSenderId: '53256422637',
    projectId: 'mobile-application-e0da4',
    storageBucket: 'mobile-application-e0da4.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCwevwIQi40bPUThpij3ZgiCrXr8qzVazY',
    appId: '1:53256422637:android:07c2ecf5d30f165a6ff8e4', // Bisa disamakan dengan android jika belum buat app windows terpisah di Firebase
    messagingSenderId: '53256422637',
    projectId: 'mobile-application-e0da4',
    storageBucket: 'mobile-application-e0da4.firebasestorage.app',
  );
}