import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              texto,
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
