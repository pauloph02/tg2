import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tg/mobile/telamobile.dart';
import 'package:tg/web/web.dart';


void main(List<String> args) {
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