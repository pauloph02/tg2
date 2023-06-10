import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'telafinal.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentQuestion = 1;
  late Timer timer;
  int timerDuration = 2;
  int? totalQuestions;

  Future _getQuestions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection("questions").get();
    totalQuestions = snapshot.docs.length;
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    _getQuestions();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(
          () {
            if (timerDuration > 0) {
              timerDuration--; // Decrementa o tempo restante do timer
            } else {
              nextQuestion();
            }
          },
        );
      },
    );
  }

  void nextQuestion() {
    timer.cancel();
    timerDuration = 2;
    setState(() => currentQuestion++);

    if (currentQuestion <= totalQuestions!) {
      startTimer();
      firestore.collection("controle").doc('K7EOVAZ1NIDtjeenbvV7').update(
        {'pergunta_corrente': currentQuestion},
      );
    } else {
      firestore.collection("controle").doc('K7EOVAZ1NIDtjeenbvV7').update(
        {'pergunta_corrente': 1},
      );
      //;

      // mostrar tela final do jogo.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaFinal(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tempo restante: $timerDuration segundos',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore.collection("controle").snapshots(),
          builder: (context, controlSnapshot) {
            if (!controlSnapshot.hasData) {
              return const CircularProgressIndicator();
            }

            var controle = controlSnapshot.data!.docs[0];
            var perguntaCorrente = controle.data()['pergunta_corrente'];

            return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: firestore
                  .collection("questions")
                  .where('ordem', isEqualTo: perguntaCorrente)
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

                return ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * .4,
                                        MediaQuery.of(context).size.height *
                                            .15),
                                    backgroundColor: Colors.red),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.star),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Text(resposta1)
                                  ],
                                )),
                            ElevatedButton(
                              onPressed: () {
                                
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * .4,
                                      MediaQuery.of(context).size.height * .15),
                                  backgroundColor: Colors.amber),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.circle),
                                  const SizedBox(
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
                                  // corrigir(resposta3, respostaCerta);
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * .4,
                                        MediaQuery.of(context).size.height *
                                            .15),
                                    backgroundColor: Colors.blue),
                                child: Row(
                                  children: [
                                    const Icon(Icons.beach_access_rounded),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Text(resposta3)
                                  ],
                                )),
                            // ignore: sort_child_properties_last
                            ElevatedButton(
                              onPressed: () {
                                // corrigir(resposta4, respostaCerta);
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
            );
          }),
    );
  }
}
