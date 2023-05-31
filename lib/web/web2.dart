// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'teladeacertos.dart';

// ignore: use_key_in_widget_constructors
class WebScreen extends StatefulWidget {
  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentQuestion = 1;
  int? totalQuestions;
  int acertos = 0;
  int timerDuration = 30; // Tempo inicial do timer (em segundos)
  late Timer timer;

  Future _getQuestions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("questions").get();
    await firestore.collection("Control").get();
    totalQuestions = snapshot.docs.length;
    FirebaseFirestore.instance
        .collection("Control")
        .where('id', isEqualTo: 131313)
        .get()
        .then(
      (QuerySnapshot snapshot) {
        for (var doc in snapshot.docs) {
          var data =
              doc.data() as Map<String, dynamic>; // Obtém os dados do documento
          var currentsQuestion = data[
              'current_question']; // Obtém o valor de 'current_question' do documento
          currentQuestion = currentsQuestion;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    _getQuestions();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (timerDuration > 0) {
          timerDuration--; // Decrementa o tempo restante do timer
        } else {
          
          
          corrigir('a', 'b');
        }
      });
    });
  }

  void corrigir(String resposta, String respostaCorreta) {
    timer.cancel();
    timerDuration = 30;
    if (resposta == respostaCorreta) {
      setState(() {
        acertos++;
      });
    }

    setState(() => currentQuestion++);
    

    if (currentQuestion <= 5) {
      startTimer();
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
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var question = snapshot.data!.docs[0];

          var pergunta = question.data()['question'];
          String resposta1 = question.data()['optionA'];
          String resposta2 = question.data()['optionB'];
          String resposta3 = question.data()['optionC'];
          String resposta4 = question.data()['optionD'];
          String respostaCerta = question.data()['correctOpt'];

          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                        'Tempo restante: $timerDuration segundos',
                        style: const TextStyle(fontSize: 20),
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: Center(
                      child: Text(
                        pergunta.toString(),
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            corrigir(resposta1, respostaCerta);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * .4,
                                  MediaQuery.of(context).size.height * .15),
                              backgroundColor: Colors.red),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star),
                              SizedBox(
                                width: 25,
                              ),
                              Text(resposta1)
                            ],
                          )),
                      ElevatedButton(
                        onPressed: () {
                          corrigir(resposta2, respostaCerta);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .4,
                                MediaQuery.of(context).size.height * .15),
                            backgroundColor: Colors.amber),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.circle),
                            SizedBox(
                              width: 25,
                            ),
                            Text(resposta2)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            corrigir(resposta3, respostaCerta);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * .4,
                                  MediaQuery.of(context).size.height * .15),
                              backgroundColor: Colors.blue),
                          child: Row(
                            children: [
                              Icon(Icons.beach_access_rounded),
                              SizedBox(
                                width: 25,
                              ),
                              Text(resposta3)
                            ],
                          )),
                      // ignore: sort_child_properties_last
                      ElevatedButton(
                        onPressed: () {
                          corrigir(resposta4, respostaCerta);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .4,
                                MediaQuery.of(context).size.height * .15),
                            backgroundColor: Colors.purple),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(Icons.bedtime_rounded),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(resposta4)
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
