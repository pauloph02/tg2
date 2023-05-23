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
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(20),
              child: Text("Jogo finalizado!!", style: TextStyle(
                  fontSize: 30
                )),
              ),
              const Padding(padding: EdgeInsets.all(20),
              child: Text("Você todas as questões, como resultado obteve:", style: TextStyle(
                  fontSize: 30
                )),
              ),
              Padding(padding: EdgeInsets.all(20),
              child: Text("${widget.acertos} acertos", style: const TextStyle(
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