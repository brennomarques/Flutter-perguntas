import 'package:flutter/material.dart';
import './question.dart';
import 'answers.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final _perguntas = const [
    {
      'texto': 'Qual e sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual seu animal favorido?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual seu instrutor favorido?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    }
  ];

  void _eResponder() {
    if (ePerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get ePerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = ePerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas']
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Perguntas")),
        ),
        body: ePerguntaSelecionada
            ? Column(
                children: <Widget>[
                  Question(_perguntas[_perguntaSelecionada]['texto']),
                  ...respostas.map((e) => Answers(e, _eResponder)).toList(),
                ],
              )
            : Center(
                child: Text(
                  'Parabéns!',
                  style: TextStyle(fontSize: 28),
                ),
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
