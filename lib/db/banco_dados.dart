import 'package:aulabancodados/db/livro.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  final String _nomeBancoDados = "meus_livros.db";

  // singleton Dart
  static final BancoDados _instance = BancoDados.internal();
  factory BancoDados() => _instance;
  BancoDados.internal();

  Database _db;

  // get do banco de dados
  // iinicializa caso não exista
  Future<Database> get db async {
    if (_db == null)
      _db = await iniciarDb();
    return _db;
  }

  Future<Database> iniciarDb() async {
    final path = await getDatabasesPath();
    final caminhoBanco = join(path, _nomeBancoDados);

    return await openDatabase(caminhoBanco, onCreate: _criarBanco, version: 1);
  }

  void _criarBanco(Database db, int newVersion) async {
    await db.execute(Livro.scriptCreate); // cria a tabela de livros
  }
}