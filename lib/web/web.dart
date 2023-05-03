import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class WebInicial extends StatefulWidget {
  const WebInicial({super.key});
  

  @override
  State<WebInicial> createState() => _WebInicialState();
}

class _WebInicialState extends State<WebInicial> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> perguntas =  ["Quantos mundiais o Palmeiras já ganhou?", "Quantas libertadores o Corinthians tem?", "Quantas bolas de ouro o Neymar possui?"];
  var isWeb = kIsWeb;
    
  @override
  Widget build(BuildContext context) {
    perguntas.shuffle();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection("questions").snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var questions = snapshot.data!.docs as List<QueryDocumentSnapshot<Map<String, dynamic>>>;
          var pergunta = questions.map((q) => q['question']);
          
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