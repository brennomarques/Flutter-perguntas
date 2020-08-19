import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int ponto;
  final void Function() resertForm;

  Result(this.ponto, this.resertForm);

  String get eFraseResult {
    if (ponto < 8) {
      return 'Parabéns!';
    } else if (ponto < 12) {
      return 'Você e bom!';
    } else if (ponto < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            eFraseResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
            child: Text(
              'Reniciar!',
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Colors.blue[50],
              ),
            ),
            textColor: Colors.blue,
            onPressed: resertForm)
      ],
    );
  }
}
