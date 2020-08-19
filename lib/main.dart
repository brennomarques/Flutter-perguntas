import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual e sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'ponto': 10},
        {'texto': 'Vermelho', 'ponto': 5},
        {'texto': 'Verde', 'ponto': 3},
        {'texto': 'Branco', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorido?',
      'respostas': [
        {'texto': 'Coelho', 'ponto': 10},
        {'texto': 'Cobra', 'ponto': 5},
        {'texto': 'Elefante', 'ponto': 3},
        {'texto': 'Leão', 'ponto': 1},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorido?',
      'respostas': [
        {'texto': 'Leo', 'ponto': 10},
        {'texto': 'Maria', 'ponto': 5},
        {'texto': 'João', 'ponto': 3},
        {'texto': 'Pedro', 'ponto': 1},
      ],
    }
  ];

  void _eResponder(int ponto) {
    if (ePerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontoTotal += ponto;
      });
    }
  }

  void _resertForm() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontoTotal = 0;
    });
  }

  bool get ePerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Perguntas")),
        ),
        body: ePerguntaSelecionada
            ? Quiz(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                eQuandoResponder: _eResponder,
              )
            : Result(_pontoTotal, _resertForm),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
