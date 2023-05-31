import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../web/teladeacertos.dart';


class TelaDeRespostas extends StatefulWidget {
  const TelaDeRespostas({super.key});

  @override
  State<TelaDeRespostas> createState() => _TelaDeRespostasState();
}

class _TelaDeRespostasState extends State<TelaDeRespostas> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentQuestion = 4;
  int? totalQuestions;
  int acertos = 0;

  Future _getQuestions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("questions").get();
         await firestore.collection("Control").get();
        totalQuestions = snapshot.docs.length;
        FirebaseFirestore.instance
      .collection("Control")
      .where('id', isEqualTo: 131313)
      .get()
      .then((QuerySnapshot snapshot) {
    for (var doc in snapshot.docs) {
      var data = doc.data() as Map<String, dynamic>; // Obtém os dados do documento
      var currentsQuestion = data['current_question']; // Obtém o valor de 'current_question' do documento
      currentQuestion = currentsQuestion;
    }
      },
      );
  }

  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  void corrigir(String resposta, String respostaCorreta) {
    if (resposta == respostaCorreta) {
      setState(() {
        acertos++;
      });
    }
    setState(() => currentQuestion++);

    if (currentQuestion <= 5) {
      firestore
          .collection("Control")
          .where('id', isEqualTo: 131313)
          .get()
          .then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.update({'current_question': currentQuestion});
        } //;
      });
    } 
    if (currentQuestion > totalQuestions!) {
      firestore
          .collection("Control")
          .where('id', isEqualTo: 131313)
          .get()
          .then((QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          doc.reference.update({'current_question': 1});
        } //;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaDeAcertos(acertos: acertos),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: firestore
            .collection("questions")
            .where('ordem', isEqualTo: currentQuestion)
            .get(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var question = snapshot.data!.docs[0];
          //var pergunta = question.data()['question'];
          String resposta1 = question.data()['optionA'];
          String resposta2 = question.data()['optionB'];
          String resposta3 = question.data()['optionC'];
          String resposta4 = question.data()['optionD'];
          String respostaCerta = question.data()['correctOpt'];
           
           
      
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                  
                  corrigir(resposta1, respostaCerta);
                },
                style: ElevatedButton.styleFrom(
                fixedSize:  Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
                backgroundColor: Colors.red
                ), 
                child: const Icon(Icons.star, color: Colors.black), 
                ),
                  ElevatedButton(onPressed: (){
                  
                  corrigir(resposta2, respostaCerta);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
                  backgroundColor: Colors.amber
                ), 
                child: const Icon(Icons.circle, color: Colors.black), 
                ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ElevatedButton(onPressed: (){
                  
                  corrigir(resposta3, respostaCerta);
                 },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
                  backgroundColor: Colors.blue
                ), 
                child: const Icon(Icons.beach_access_rounded, color: Colors.black), 
              ),
               ElevatedButton(onPressed: (){
                
                corrigir(resposta4, respostaCerta);
               },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
                backgroundColor: Colors.purple
              ), 
              child: const Icon(Icons.bedtime_rounded, color: Colors.black), 
              ),
            ],
          )
          ],
          );
          
        
      
  }
    )
    );
  }
}