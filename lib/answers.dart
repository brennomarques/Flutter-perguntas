import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String texto;

  final void Function() onSelection;

  Answers(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(texto),
        onPressed: onSelection,
      ),
    );
  }
}
