// ignore: implementation_imports
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'teladerespostas.dart';

class TelaMobile extends StatefulWidget {
  const TelaMobile({super.key});

  @override
  State<TelaMobile> createState() => _TelaMobileState();
}

class _TelaMobileState extends State<TelaMobile> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  String nickname = '';
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => nickname = value,
                  decoration: const InputDecoration(
                    hintText: 'Insira seu Nickname'
                  ),
                  controller: nicknameController,
          
                ),
                const SizedBox( height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Insira o código da sala'
                  ),
                  onChanged: (value) => code = value,
                  controller: codeController,
                ),
                const SizedBox(height: 20,),
                 ElevatedButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) =>
                      TelaDeRespostas()
                    ))
                  ).then((value) => setState((){}));
                 }, child: const Icon(
                  Icons.connect_without_contact
                 ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}