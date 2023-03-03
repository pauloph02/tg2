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
            Container(
              height: 250,
              width: 150,
              color: Colors.red,
              child: const Icon(Icons.star_rounded),
            ),
            Container(
              height: 250,
              width: 150,
              color: Colors.amber,
              child: const Icon(Icons.circle),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 250,
              width: 150,
              color: Colors.blue,
              child: const Icon(Icons.beach_access_rounded),
            ),
            Container(
              height: 250,
              width: 150,
              color: Colors.purple,
              child: const Icon(Icons.bedtime_rounded),
            )
          ],
        )
        ],
        )
      
    );
  }
}