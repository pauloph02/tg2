import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaDeRespostas2 extends StatefulWidget {
  int acertos;
   TelaDeRespostas2({Key? key, required this.acertos}) : super(key: key);
  

  @override
  State<TelaDeRespostas2> createState() => _TelaDeRespostas2State();
}

class _TelaDeRespostas2State extends State<TelaDeRespostas2> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("questions").where('id', isEqualTo: "a").snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var questions = snapshot.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
          var pergunta = questions.map((q) => q['question']);
           String resposta1 = questions.map((q) => q['optionA']).toString();
           String resposta2 = questions.map((q) => q['optionB']).toString();
           String resposta3 = questions.map((q) => q['optionC']).toString();
           String resposta4 = questions.map((q) => q['optionD']).toString();
           String respostaCerta = questions.map((q) => q['correctOpt']).toString();
           int acertos = 0;
           String respostaDada = "";
           corrigir(resposta){
            if (resposta == respostaCerta){
              acertos += 1;
              Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDeRespostas2(acertos: acertos,) ));
              
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDeRespostas2(acertos: acertos,) ));
            }
           }
      
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              fixedSize:  Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
              backgroundColor: Colors.red
            ), 
            child: const Icon(Icons.star, color: Colors.black), 
            ),
             ElevatedButton(onPressed: (){},
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
             ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.of(context).size.width * .42, MediaQuery.of(context).size.height * .42),
              backgroundColor: Colors.blue
            ), 
            child: const Icon(Icons.beach_access_rounded, color: Colors.black), 
            ),
             ElevatedButton(onPressed: (){},
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