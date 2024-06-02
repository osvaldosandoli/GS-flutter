import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});
//mudança nos textos de resultados
  String get fraseResultado {
    if (pontuacao <= 14) {
      return 'Que pena não foi tão bem :(\n Sua pontuação foi: $pontuacao / 45';
    } else if (pontuacao < 28 && pontuacao > 21) {
      return 'Dá para passar de ano!\n Sua pontuação foi: $pontuacao / 45';
    } else if (pontuacao < 21 && pontuacao > 15) {
      return 'Conselho do oceano ._.\n Sua pontuação foi: $pontuacao / 45';
    } else {
      return 'Genio dos oceanos! \n Sua pontuação foi: $pontuacao / 45';
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
