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
}