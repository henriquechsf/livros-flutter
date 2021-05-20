import 'package:aulabancodados/db/livro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaDadosLivro {
  static Widget criar(BuildContext context, Livro livro, Function itemClique) {
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