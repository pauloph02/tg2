import 'package:flutter/material.dart';

class TelaDeRespostas extends StatefulWidget {
  const TelaDeRespostas({super.key});

  @override
  State<TelaDeRespostas> createState() => _TelaDeRespostasState();
}

class _TelaDeRespostasState extends State<TelaDeRespostas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Column(
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
        )
      
    );
  }
}