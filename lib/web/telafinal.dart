import 'package:flutter/material.dart';
class TelaFinal extends StatefulWidget {
  const TelaFinal({
    Key? key,
  }) : super(key: key);

  @override
  State<TelaFinal> createState() => _TelaFinalState();
}
class _TelaFinalState extends State<TelaFinal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(200),
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 180, 204),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Jogo finalizado!!",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Parabéns por chegar até aqui!",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Verifique sua quantidade de acertos na tela do seu celular.",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
