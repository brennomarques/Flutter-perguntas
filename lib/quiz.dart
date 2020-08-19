import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) eQuandoResponder;

  Quiz({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.eQuandoResponder,
  });

  bool get ePerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = ePerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Question(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Answers(
            resp['texto'],
            () => eQuandoResponder(resp['ponto']),
          );
        }).toList(),
      ],
    );
  }
}
