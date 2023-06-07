import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Armazenar no firestore a currentQuestion
  var currentQuestion = 1;
   List<int> perguntasRespondidas = [];
  int? totalQuestions;
  int acertos = 0;

  // Future _getQuestions() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await firestore.collection("questions").get();
  //   totalQuestions = snapshot.docs.length;
  // }

  @override
  void initState() {
    super.initState();
    // _getQuestions();
  }

  void corrigir(String resposta, String respostaCorreta) {
    
      if (resposta == respostaCorreta) {
        setState(() {
          acertos++;
        });
      }
      
  
     
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acertos: $acertos"),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: firestore.collection("controle").snapshots(),
        builder: (context, controlSnapshot) {
          if (!controlSnapshot.hasData) {
            return const CircularProgressIndicator();
          }

          var controle = controlSnapshot.data!.docs[0];
          var perguntaCorrente = controle.data()['pergunta_corrente'];

          bloquear(){
            setState(() {
      perguntasRespondidas.add(perguntaCorrente); // Adicionar a pergunta atual ao array de perguntas respondidas
    });
          }

          

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
                      ElevatedButton (
                        onPressed: perguntasRespondidas.contains(perguntaCorrente) ? null : () {
                          corrigir(resposta1, respostaCerta);
                          bloquear();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .42,
                                MediaQuery.of(context).size.height * .42),
                            backgroundColor: Colors.red),
                        child: const Icon(Icons.star, color: Colors.black),
                      ),
                      ElevatedButton(
                        onPressed: perguntasRespondidas.contains(perguntaCorrente) ? null : () {
                          corrigir(resposta2, respostaCerta);
                          bloquear();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .42,
                                MediaQuery.of(context).size.height * .42),
                            backgroundColor: Colors.amber),
                        child: const Icon(Icons.circle, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: perguntasRespondidas.contains(perguntaCorrente) ? null :() {
                          corrigir(resposta3, respostaCerta);
                          bloquear();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .42,
                                MediaQuery.of(context).size.height * .42),
                            backgroundColor: Colors.blue),
                        child: const Icon(Icons.beach_access_rounded,
                            color: Colors.black),
                      ),
                      ElevatedButton(
                        onPressed: perguntasRespondidas.contains(perguntaCorrente) ? null :() {
                          corrigir(resposta4, respostaCerta);
                          bloquear();
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .42,
                                MediaQuery.of(context).size.height * .42),
                            backgroundColor: Colors.purple),
                        child: const Icon(Icons.bedtime_rounded,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
