import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tg/web/perguntaquatro.dart';


class PerguntaTres extends StatefulWidget {
  int acertos;
   PerguntaTres({Key? key, required this.acertos}) : super(key: key);
  

  @override
  State<PerguntaTres> createState() => _PerguntaTresState();
}

class _PerguntaTresState extends State<PerguntaTres> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> perguntas =  ["Quantos mundiais o Palmeiras já ganhou?", "Quantas libertadores o Corinthians tem?", "Quantas bolas de ouro o Neymar possui?"];
  var isWeb = kIsWeb;
  
  
 
    
  @override
  Widget build(BuildContext context) {
    perguntas.shuffle();
    
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("questions").where('id', isEqualTo: "c").snapshots(),
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
           String respostaDada = "";
           corrigir(resposta){
            if (resposta == respostaCerta){
              widget.acertos += 1;
              
              
            }
              print(widget.acertos);
              Navigator.push(context, MaterialPageRoute(builder: (context) => PerguntaQuatro(acertos: widget.acertos,) ));
            
           }
          
            return  ListView(
              children:  [Column(
              crossAxisAlignment: CrossAxisAlignment.center
              ,children: [
              
              SizedBox(
                
                height: MediaQuery.of(context).size.height * .5,
                child: Center(child: Text(pergunta.toString(), style: const TextStyle(
                  fontSize: 30
                ),))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    respostaDada = "(A)";
                    
                    
                    corrigir(respostaDada);
                   
                  },
                   style: ElevatedButton.styleFrom(
                  fixedSize:  Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.red
                ), child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      Icon(Icons.star),
                      SizedBox(width: 25,),
                      Text(resposta1)
                      /* Center(
                        child: Text(resposta1, style: const TextStyle(
                        fontSize: 30
                ),)) */
                    ],
                  )
                   ),
                  ElevatedButton(onPressed: (){
                    respostaDada = "(B)";
                  
                     corrigir(respostaDada);
                     
              
                  },
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.amber
                ),child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      Icon(Icons.circle),
                      SizedBox(width: 25,),
                      Text(resposta2)
                    ],
                  ), 
                   )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
                    respostaDada = "(C)";
                    corrigir(respostaDada);
                    
                  },
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.blue
                ), child: 
                  Row(
                    children:  [
                      Icon(Icons.beach_access_rounded),
                      SizedBox(width: 25,),
                      Text(resposta3)
                    ],
                  )
                   ),
                  // ignore: sort_child_properties_last
                  ElevatedButton(child: 
                  Row(
                    
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.bedtime_rounded),
                      const SizedBox(width: 25,),
                       Text(resposta4)
                    ],
                  ),
                   onPressed: (){
                    respostaDada = "(D)";
                    corrigir(respostaDada);
                    
                   },
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.purple
                ),
                   )/* Text(q['question'])
                ).toList() */
              ])
            ]
            )
            ]); 
        },
        
      )
      /* Padding(
        
        padding: const EdgeInsets.all(30),
          child: ListView(
            children: [Column(
              crossAxisAlignment: CrossAxisAlignment.center
              ,children: [
              
              SizedBox(
                
                height: MediaQuery.of(context).size.height * .5,
                child: Center(child: Text(perguntas.first, style: const TextStyle(
                  fontSize: 30
                ),))),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                  fixedSize:  Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.red
                ), child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.star),
                      SizedBox(width: 25,),
                      Text("0")
                    ],
                  )
                   ),
                  ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.amber
                ),child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.circle),
                      SizedBox(width: 25,),
                      Text("1")
                    ],
                  ), 
                   )
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){},
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.blue
                ), child: 
                  Row(
                    children: const [
                      Icon(Icons.beach_access_rounded),
                      SizedBox(width: 25,),
                      Text("2")
                    ],
                  )
                   ),
                  // ignore: sort_child_properties_last
                  ElevatedButton(child: 
                  Row(
                    
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(Icons.bedtime_rounded),
                      const SizedBox(width: 25,),
                      const Text("3")
                    ],
                  ),
                   onPressed: (){},
                   style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .4, MediaQuery.of(context).size.height *.15),
                  backgroundColor: Colors.purple
                ),
                   )
                ],
              )
            ]
            ),
         ]   ),
        ), */
        );
    
    
  }
}