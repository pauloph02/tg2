// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class TelaFinal extends StatefulWidget {
   const TelaFinal({Key? key,}) : super(key: key);
  

  @override
  State<TelaFinal> createState() => _TelaFinalState();
}

class _TelaFinalState extends State<TelaFinal> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
 
    
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: const [
              Padding(padding: EdgeInsets.all(20),
              child: Text("Jogo finalizado!!", style: TextStyle(
                  fontSize: 30
                )),
              ),
              Padding(padding: EdgeInsets.all(20),
              child: Text("Você todas as questões, como resultado obteve:", style: TextStyle(
                  fontSize: 30
                )),
              ),
              Padding(padding: EdgeInsets.all(20),
              child: Text("acertos", style: TextStyle(
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