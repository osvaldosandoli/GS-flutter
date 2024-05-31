import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    //MODIFICAÇAÕ DAS PERGUNTAS E A ADIÇÃO DE NOVAS PERGUNTAS
    {
      'texto': '1 - Qual é o maior oceano do planeta terra?',
      'respostas': [
        {'texto': 'Oceano Pacífico', 'pontuacao': 10},
        {'texto': 'Oceano Atlântico', 'pontuacao': 5},
        {'texto': 'Oceano Índico', 'pontuacao': 3},
        {'texto': 'Mar Mediterrâneo', 'pontuacao': 1},
      ],
    },
    {
      'texto': '2 - Qual lixo que é mais vezes encontrado no mar?',
      'respostas': [
        {'texto': 'Plástico', 'pontuacao': 10},
        {'texto': 'Bituca de cigarro', 'pontuacao': 5},
        {'texto': 'metal', 'pontuacao': 3},
        {'texto': 'isopor', 'pontuacao': 1},
      ],
    },
    {
      'texto': '3 - Qual os animais que mais sofrem com a poluição dos mares?',
      'respostas': [
        {'texto': 'Tartarugas marinhas', 'pontuacao': 10},
        {'texto': 'focas', 'pontuacao': 5},
        {'texto': 'leões marinhos', 'pontuacao': 3},
        {'texto': 'golfinhos', 'pontuacao': 1},
      ],
    },
    {
      'texto': '4 - Qual é a principal causa do lixo no oceano?',
      'respostas': [
        {'texto': 'Animais marinhos', 'pontuacao': 3},
        {'texto': 'Tempestades', 'pontuacao': 5},
        {'texto': 'Atividades humanas', 'pontuacao': 10},
        {'texto': 'Ondas do mar', 'pontuacao': 1},
      ],
    },
    {
      'texto':
          '5 - O que podemos fazer para ajudar a reduzir o lixo nos oceanos?',
      'respostas': [
        {'texto': 'Jogar lixo no chão', 'pontuacao': 1},
        {'texto': 'Usar menos plástico', 'pontuacao': 5},
        {'texto': 'Comprar mais coisas', 'pontuacao': 3},
        {'texto': 'Deixar o lixo na praia', 'pontuacao': 1},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
//Mudança do titulo e a adição de um plano de fundo com degrade
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas e respostas sobre o Oceano'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade200, const Color.fromARGB(255, 10, 88, 156)],
            ),
          ),
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
