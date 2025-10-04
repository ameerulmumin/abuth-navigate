import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB7AEXLsJlEsDKRaHyQd2mQ_7s6loOkwSY",
            authDomain: "abuth-navigate-me.firebaseapp.com",
            projectId: "abuth-navigate-me",
            storageBucket: "abuth-navigate-me.appspot.com",
            messagingSenderId: "993316165292",
            appId: "1:993316165292:web:0a11600ad6206de86f3109",
            measurementId: "G-FXGDLXRN37"));
  } else {
    await Firebase.initializeApp();
  }
}
