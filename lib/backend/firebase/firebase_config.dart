import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBjuS5IvyyccrjmSpdAXjIuBTTGuAokmMw",
            authDomain: "spare-asbnhq.firebaseapp.com",
            projectId: "spare-asbnhq",
            storageBucket: "spare-asbnhq.firebasestorage.app",
            messagingSenderId: "912392965680",
            appId: "1:912392965680:web:62e4993ca4293ab21367f5"));
  } else {
    await Firebase.initializeApp();
  }
}
