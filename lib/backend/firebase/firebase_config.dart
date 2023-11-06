import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAVa-Ax5DXazALdzBpzegxSX2SXKM2b3tI",
            authDomain: "laporin-2a13f.firebaseapp.com",
            projectId: "laporin-2a13f",
            storageBucket: "laporin-2a13f.appspot.com",
            messagingSenderId: "610053201327",
            appId: "1:610053201327:web:1df7b7c0931d396302a35a",
            measurementId: "G-96DDP0K4RF"));
  } else {
    await Firebase.initializeApp();
  }
}
