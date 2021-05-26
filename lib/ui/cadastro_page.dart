import 'dart:ffi';

import 'package:aulabancodados/db/livro.dart';
import 'package:aulabancodados/db/livro_helper.dart';
import 'package:aulabancodados/funcoes.dart';
import 'package:aulabancodados/widgets/barra_titulo.dart';
import 'package:aulabancodados/widgets/botao.dart';
import 'package:aulabancodados/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {

  final Livro _livro;

  // construtor
  CadastroPage(this._livro);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  LivroHelper livroHelper = LivroHelper();

  final nomeController = TextEditingController();
  final editoraController = TextEditingController();
  final anoController = TextEditingController();

  // executado quando a tela é criada
  // para acessar um atributo da classe principal é necessário "widget"
  @override
  void initState() {
    super.initState();
    if(widget._livro != null) {
      nomeController.text = widget._livro.nome;
      editoraController.text = widget._livro.editora ?? "";
      anoController.text = widget._livro.ano != null ? widget._livro.ano.toString() : "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BarraTitulo.criar('Cadastro de Livro'),
      body: ListView(
        children: <Widget>[
          CampoTexto.criar("Nome", "", nomeController, TextInputType.text),
          CampoTexto.criar("Editora", "", editoraController, TextInputType.text),
          CampoTexto.criar("Ano", "", anoController, TextInputType.number),
          Botao.criar("Salvar", _salvarLivro, cor: Colors.green, icone: Icons.save),
          _criarBotaoExcluir(),
        ],
      ),
    );
  }

  void _salvarLivro() {
    if(nomeController.text.isEmpty) {
      Funcoes().mostrarMensagem(context, "Atenção", "Nome do livro é obrigatório!");
      return;
    }
    if(editoraController.text.isEmpty) {
      Funcoes().mostrarMensagem(context, "Atenção", "Editora do livro é obrigatório!");
      return;
    }
    if(anoController.text.isEmpty) {
      Funcoes().mostrarMensagem(context, "Atenção", "Ano do livro é obrigatório!");
      return;
    }

    // instancia do livro
    var livro = Livro();
    livro.nome = nomeController.text;
    livro.editora = editoraController.text;
    livro.ano = int.parse(anoController.text);

    // salva ou edita
    if(widget._livro == null) {
      livroHelper.inserir(livro);
    } else {
      livro.codigo = widget._livro.codigo;
      livroHelper.alterar(livro);
    }

    // fecha a tela
    Navigator.pop(context);
  }

  Widget _criarBotaoExcluir() {
    if(widget._livro != null) {
      return Botao.criar("Excluir", _excluirLivro, cor: Colors.red, icone: Icons.delete);
    } else {
      return Container();
    }
  }

  void _excluirLivro() {
    Funcoes().mostrarPergunta(context, "Atenção", "Deseja excluir este livro?",
        "Sim", "Não", _confirmarExclusao, () {});
  }

  void _confirmarExclusao() {
    livroHelper.apagar(widget._livro.codigo);
    Navigator.pop(context);
  }
}
