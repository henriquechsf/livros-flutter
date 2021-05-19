import 'package:aulabancodados/db/livro.dart';
import 'package:aulabancodados/funcoes.dart';
import 'package:aulabancodados/widgets/lista_dados_livro.dart';
import 'package:flutter/material.dart';

class ListaDados {
  static Widget criar(BuildContext context, AsyncSnapshot snapshot, int tipo, Function itemClique) {
    return ListView.builder(
      padding: EdgeInsets.all(6),
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return _retornaLista(context, tipo, snapshot.data[index], itemClique);
      },
    );
  }

  static Widget _retornaLista(BuildContext context, int tipo, Livro dados, Function itemClique) {
    switch (tipo) {
      case Funcoes.LISTA_LIVRO:
       return ListaDadosLivro.criar(context, dados, itemClique);
      default:
        return Container();
    }
  }
}