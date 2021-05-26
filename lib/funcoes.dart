import 'package:flutter/material.dart';

class Funcoes {
  static const LISTA_LIVRO = 1;

  static Widget _criarIconeEspacado(IconData icone, Color cor, double tamanho) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Icon(icone, color: cor, size: tamanho,),
    );
  }

  static Widget criarIcone(IconData icone, {Color cor, double tamanho}) {
    return icone != null ? _criarIconeEspacado(icone, cor, tamanho) : Container();
  }

  void mostrarMensagem(BuildContext context, String tituloMensagem, String corpoMensagem) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(tituloMensagem),
            content: Text(corpoMensagem),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () { _fecharTelaAtual(context); },
              ),
            ],
          );
        }
    );
  }

  void _fecharTelaAtual(BuildContext context) {
    Navigator.pop(context);
  }

  Future<bool> mostrarPergunta(BuildContext context, String titulo,
      String texto, String txtSim, String txtNao, cliqueSim, cliqueNao) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(texto),
          actions: <Widget>[
            TextButton(
              child: Text(txtSim),
              onPressed: () {
                cliqueSim();
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              child: Text(txtNao),
              onPressed: () {
                cliqueNao();
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      }
    );
  }
}