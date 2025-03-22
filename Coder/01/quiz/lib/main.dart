import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';

main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0.0;

  final List<Map> perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 8},
        {'texto': 'Amarelo', 'nota': 6},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Leao', 'nota': 4},
        {'texto': 'Gato', 'nota': 8},
      ],
    },
    {
      'texto': 'Qual é casa favorita?',
      'respostas': [
        {'texto': 'Ap', 'nota': 8},
        {'texto': 'Casa', 'nota': 9},
        {'texto': 'Mansão', 'nota': 10},
      ],
    },
    {
      'texto': 'Qual é o num sei o que lá?',
      'respostas': [
        {'texto': 'Sei não', 'nota': 5},
        {'texto': 'Sei lá', 'nota': 6},
        {'texto': 'Num sei', 'nota': 7},
      ],
    },
  ];

  void _responder(double notaTotal) {
    if (temProximaPergunta) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += notaTotal;
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perguntas'),
          backgroundColor: Colors.amber,
        ),
        body: Questionario(
          perguntaSelecionada: _perguntaSelecionada,
          perguntas: perguntas,
          onResponder: _responder,
          onRetornarAoInicio: _retornarAoInicio,
          notaTotal: _notaTotal,
        ),
      ),
    );
  }
}
