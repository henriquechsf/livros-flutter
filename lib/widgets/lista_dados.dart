import 'package:flutter/material.dart';

class ListaDados {
  static Widget criar(BuildContext context, AsyncSnapshot snapshot, int tipo, Function itemClique) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return _retornaLista(tipo, snapshot.data[index], itemClique);
      },
    );
  }

  static Widget _retornaLista(int tipo, Map dados, Function itemClique) {
    switch (tipo) {
      //case Funcoes.LISTA_EMISSORA:
      //  return ListaDadosEmissora.criarItem(dados);
      default:
        return Container();
    }
  }
}