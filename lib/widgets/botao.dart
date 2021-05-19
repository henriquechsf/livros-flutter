import 'package:aulabancodados/funcoes.dart';
import 'package:flutter/material.dart';

class Botao {

  static Widget criar(String texto, Function clique, {IconData icone, double tamanhoBotao = 150,
    Color cor}) {
    return RaisedButton(
      child: Container(
        width: tamanhoBotao,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Funcoes.criarIcone(icone, cor: Colors.white, tamanho: 25),
            Text(texto, style: TextStyle(color: Colors.white, fontSize: 25),),
          ],
        ),
      ),
      color: cor,
      onPressed: clique,
    );
  }

  static Widget criarBotaoBarra(IconData icone, Function evento) {
    return IconButton(
      icon: Funcoes.criarIcone(icone),
      onPressed: evento,
    );
  }

  static Widget criarBotaoFlutuante(IconData icone, Function evento) {
    return FloatingActionButton(
      child: Funcoes.criarIcone(icone),
      onPressed: evento,
    );
  }
}