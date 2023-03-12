import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebInicial extends StatefulWidget {
  const WebInicial({super.key});

  @override
  State<WebInicial> createState() => _WebInicialState();
}

class _WebInicialState extends State<WebInicial> {
  List<String> perguntas =  ["Quantos mundiais o Palmeiras já ganhou?", "Quantas libertadores o Corinthians tem?", "Quantas bolas de ouro o Neymar possui?"];
  var isWeb = kIsWeb;

  
  @override
  Widget build(BuildContext context) {
    perguntas.shuffle();
    return Scaffold(
      body: Padding(
        
        padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center
            ,children: [
            
            Container(
              
              height: 370,
              child: Center(child: Text(perguntas.first, style: TextStyle(
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
                fixedSize: const Size(500, 75),
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
                fixedSize: const Size(500, 75),
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
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){},
                 style: ElevatedButton.styleFrom(
                fixedSize: const Size(500, 75),
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
                fixedSize: const Size(500, 75),
                backgroundColor: Colors.purple
              ),
                 )
              ],
            )
          ]
          ),
        ),
        );
    
    
  }
}