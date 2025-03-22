import 'package:flutter/material.dart';
import 'package:quiz/questao.dart';
import 'package:quiz/resposta.dart';
import 'package:quiz/resultado.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map> perguntas;
  final void Function(double) onResponder;
  final void Function() onRetornarAoInicio;
  final double notaTotal;

  const Questionario({
    super.key,
    required this.perguntaSelecionada,
    required this.perguntas,
    required this.onResponder,
    required this.onRetornarAoInicio,
    required this.notaTotal,
  });

  bool get temProximaPergunta {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> respostasTexto =
        temProximaPergunta ? perguntas[perguntaSelecionada]['respostas'] : [];

    List<Widget> respostas =
        respostasTexto
            .map(
              (resp) => Resposta(
                texto: resp['texto'],
                onSelecao: () => onResponder(resp['nota'].toDouble()),
              ),
            )
            .toList();

    //    print(respostasTexto.map((resp) => resp['nota']));

    return temProximaPergunta
        ? Column(
          children: [
            Questao(texto: perguntas[perguntaSelecionada]['texto']),
            ...respostas,
          ],
        )
        : Resultado(
          onRetornarAoInicio: onRetornarAoInicio,
          notaTotal: notaTotal,
        );
  }
}
