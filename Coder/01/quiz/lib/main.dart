import 'package:flutter/material.dart';
import 'package:quiz/questao.dart';
import 'package:quiz/resposta.dart';

main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;

  final List<Map> perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Amarelo'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cobra', 'Leao', 'Gato'],
    },
    {
      'texto': 'Qual é casa favorita?',
      'respostas': ['Ap', 'Casa', 'Mansão'],
    },
    {
      'texto': 'Qual é o num sei o que lá?',
      'respostas': ['Sei não', 'Sei lá', 'Num sei'],
    },
  ];

  void _responder() {
    if (temProximaPergunta) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  void _retornarAoInicio() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool get temProximaPergunta {
    return _perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostasTexto =
        temProximaPergunta ? perguntas[_perguntaSelecionada]['respostas'] : [];

    List<Widget> respostas =
        respostasTexto
            .map((e) => Resposta(texto: e, onSelecao: _responder))
            .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perguntas'),
          backgroundColor: Colors.amber,
        ),
        body:
            temProximaPergunta
                ? Column(
                  children: [
                    Questao(texto: perguntas[_perguntaSelecionada]['texto']),
                    ...respostas,
                  ],
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30,
                  children: [
                    Center(
                      child: Text(
                        'Parabéns Amigãooo!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: _retornarAoInicio,
                      child: Text('Retornar'),
                    ),
                  ],
                ),
      ),
    );
  }
}
