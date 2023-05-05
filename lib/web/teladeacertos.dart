import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class TelaDeAcertos extends StatefulWidget {
  int acertos;
   TelaDeAcertos({Key? key, required this.acertos}) : super(key: key);
  

  @override
  State<TelaDeAcertos> createState() => _TelaDeAcertosState();
}

class _TelaDeAcertosState extends State<TelaDeAcertos> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var isWeb = kIsWeb;
  
  
 
    
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
          color: Colors.amber                 
                ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20),
              child: Text("Jogo finalizado!!", style: const TextStyle(
                  fontSize: 30
                )),
              ),
              Padding(padding: EdgeInsets.all(20),
              child: Text("Seu resultado foi: ${widget.acertos}/5", style: const TextStyle(
                  fontSize: 30
                )),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}