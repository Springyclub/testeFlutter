import 'package:sqlite/sqflite.dart';
import '../components/task.dart';
import 'database.dart';

///banco de dados
class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT,'
      '$_difficulty INTEGER '
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _image = 'image';
  static const String _difficulty = 'difficulty';

  ///Card of champions
  save(Task tarefa) async {
    print('Iniciando o save');
    final Database database = await getDatabase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      print('A tarefa não existia');
      return await database.insert(_tableName, taskMap); //Tinha await aqui
    } else {
      print('A tarefa já existia');
      return database.update(
        //Tinha await aqui
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    print('Convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = Map();
    //final mapaDeTarefas = <String, dynamic>{};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificultade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('Mapa de tarefas $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Procurando dados no banco de dadas ... Encontrados: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> listaDeTarefas) {
    print('Estamos convertendo toList');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    print('lista de tarefas: $tarefas');
    return tarefas;
  }

  Future<List<Task>> find(String tarefaName) async {
    print("Estamos acessando o find");
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [tarefaName],
    );
    print('Tarefa encontrada:\n'
        '${toList(result)}');
    return toList(result);
  }

  ///delete card champions
  delete(String nomeTarefa) async {
    print('deletando tarefa $nomeTarefa');
    final Database database = await getDatabase();
    return await database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeTarefa],
    );
  }
}
