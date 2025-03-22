import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() onRetornarAoInicio;
  final double notaTotal;

  const Resultado({
    super.key,
    required this.onRetornarAoInicio,
    required this.notaTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Center(
          child: Column(
            children: [
              Text('Parabéns Amigãooo!', style: TextStyle(fontSize: 20)),
              Text('Sua nota foi: $notaTotal', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
          onPressed: onRetornarAoInicio,
          child: Text('Retornar'),
        ),
      ],
    );
  }
}
