import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {Key? key}) : super(key: key);

  @override
  //ADIÇÃO DO PADDING E MUDANÇA NO LARGURA E ALTURA DOS BOTÕES
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // Adiciona espaçamento vertical entre os botões
      child: Container(
        width: 250,
        height: 110,
        //Adição de imagem ao botão e tambem e o arredondamento da borda
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          image: const DecorationImage(
            image: AssetImage('22457141-largo-bandeira-verao-tarde-mar-fundo-por-do-sol-rosa-luz-iate-dentro-a-mar-e-de-praia-coquetel-em-a-areia-cartao-postal-feriado-estacao-anuncio-de-praia-feriado-vetor.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: quandoSelecionado,
          //MUDANÇA DE COR E DE FONTE DO TEXTO
          child: Text(
            texto,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
