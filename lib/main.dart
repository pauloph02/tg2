import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tg/mobile/telamobile.dart';
import 'package:tg/web/web.dart';
import 'package:firebase_core/firebase_core.dart';


const firebaseOptions  = FirebaseOptions(
  apiKey: "AIzaSyBbuHFV3FTzxBroudefmtQfkBedcdw6hvc",
  authDomain: "trabalhograduacao-82ecd.firebaseapp.com",
  projectId: "trabalhograduacao-82ecd",
  storageBucket: "trabalhograduacao-82ecd.appspot.com",
  messagingSenderId: "388399462809",
  appId: "1:388399462809:web:9743d601bc40ef3c11fb08"
);



void main(List<String> args) async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var isWeb = kIsWeb;

    return  MaterialApp(
        home: isWeb ? const WebInicial() : const TelaMobile(),
      );
    
    
    
  }
}