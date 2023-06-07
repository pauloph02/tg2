import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'mobile/teladerespostas.dart';
import 'web/web2.dart';


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
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentQuestion = 1;

  void updateCurrentQuestion(int newQuestion) {
    // Atualiza o estado da classe pai com a nova pergunta
    setState(() {
      currentQuestion = newQuestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isWeb = kIsWeb;

    return  MaterialApp(
        home: isWeb ?  TelaDeRespostas(onCurrentQuestionChanged: updateCurrentQuestion) : TelaDeRespostas(onCurrentQuestionChanged: updateCurrentQuestion),
      );
    
    
    
  }
}