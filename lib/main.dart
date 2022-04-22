import 'package:barex_website/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCklJI1eV5UCrvLK8o0Zg5YvEFxxQcF3Bk",
        authDomain: "barex-9acac.firebaseapp.com",
        projectId: "barex-9acac",
        storageBucket: "barex-9acac.appspot.com",
        messagingSenderId: "848112716192",
        appId: "1:848112716192:web:f9d0f96be2a9bd8ac2bcc5",
        measurementId: "G-37NKQJT4ZK"
    )
  );

  runApp(const App());
}


