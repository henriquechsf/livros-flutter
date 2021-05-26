import 'package:aulabancodados/db/livro.dart';
import 'package:aulabancodados/db/livro_helper.dart';
import 'package:aulabancodados/funcoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDadosLivro {
  static Widget criar(BuildContext context, Livro livro, Function itemClique) {
    return Dismissible(
      key: UniqueKey(),
      child: _criarItem(livro, itemClique),
      direction: DismissDirection.endToStart,
      background: _criarPainelExcluir(),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          LivroHelper().apagar(livro.codigo);
        }
      },
      confirmDismiss: (DismissDirection direction) {
        return Funcoes().mostrarPergunta(context, "Atenção", "Deseja excluir este livro?",
            "Sim", "Não", (){}, (){});
      },
    );
  }

  static Widget _criarPainelExcluir() {
    return Container(
      alignment: Alignment(1, 0),
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Excluir Livro", style: TextStyle(color: Colors.white),),
          Icon(Icons.delete, color: Colors.white,)
        ],
      ),
    );
  }

  static Widget _criarItem(Livro livro, Function itemClique) {
    return GestureDetector(
      onTap: () {
        itemClique(livro);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(child: Text(livro.nome, style: TextStyle(fontWeight: FontWeight.bold),)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(livro.editora),
                  Text(livro.ano != null ? livro.ano.toString() : ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}