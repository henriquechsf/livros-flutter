import 'package:aulabancodados/db/livro_helper.dart';
import 'package:aulabancodados/funcoes.dart';
import 'package:aulabancodados/ui/cadastro_page.dart';
import 'package:aulabancodados/widgets/barra_titulo.dart';
import 'package:aulabancodados/widgets/botao.dart';
import 'package:aulabancodados/widgets/circulo_aguarde.dart';
import 'package:aulabancodados/widgets/erro_listagem.dart';
import 'package:aulabancodados/widgets/lista_dados.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LivroHelper livroHelper = new LivroHelper();

  Future<List<dynamic>> _getLista() async {
    return await livroHelper.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar("Meus Livros"),
      floatingActionButton: Botao.criarBotaoFlutuante(Icons.add, () {
        _cliqueItem();
      }),
      body: FutureBuilder(
        future: _getLista(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return CirculoAguarde.criar();
            default:
              if (snapshot.hasError) {
                return ErroListagem.criar("Não foi possível carragar os livros");
              } else {
                return _criarListagem(context, snapshot);
              }
          }
        },
      ),
    );
  }

  Widget _criarListagem(BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      // cor em hexadecimal
      color: Color(0xFFEEEEEE),
      child: ListaDados.criar(context, snapshot, Funcoes.LISTA_LIVRO),
    );
  }

  void _cliqueItem() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroPage()));
  }

}
