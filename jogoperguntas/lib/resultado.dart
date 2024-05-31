import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});
//mudança nos textos de resultados
  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Que pena não foi tão bem :(';
    } else if (pontuacao < 12) {
      return 'Dá para passar de ano!';
    } else if (pontuacao < 16) {
      return 'Nota 8 ._.';
    } else {
      return 'Genio dos oceanos!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            //mudança do tamanho do texto e das cores
            fraseResultado,
            style: const TextStyle(
              fontSize: 50,
              color: Colors.black	
            ),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: const Text(
            //Mudança no nome do botão reniciar e na formatação do texto
            'Voltar ao menu de perguntas',
            style: TextStyle(
              fontSize: 20,
              color: Colors.red
            ),
          ),
        ),
      ],
    );
  }
}
