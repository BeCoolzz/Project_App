import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = "todo";
final String Column_id = "id";
final String Column_name = "name";

class TodoModel {
  final String name;
  int id;

  TodoModel({this.name, this.id});

  /*  Map is used to store data in dadtabase
      The function name of this function is toMap
      dynamic means we can return any type of value like string or int*/
  Map<String, dynamic> toMap() {
    return {
      Column_name : this.name
    };
  }
}

class TodoHelper {
  Database db;

  TodoHelper() {
    initDatabase();
  }

  //  Initialization function
  Future<void> initDatabase() async {
    db = await openDatabase(
      //  join-function joins two string and make a complete path to a file
      //  It joins database.db to the path where this file shoul be saved
      join(await getDatabasesPath(), "database.db"),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE $tableName($Column_id INTEGER PRIMARY KEY AUTOINCREMENT, $Column_name TEXT)");
      },
      version: 1
    );
  }

  Future<void> insertTask(TodoModel task) async {
    try {
      db.insert(tableName, task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

  Future<List<TodoModel>> getAllTask() async {
    final List<Map<String, dynamic>> tasks = await db.query(tableName);

    return List.generate(tasks.length, (i) {
      return TodoModel(name: tasks[i][Column_name], id: tasks[i][Column_id]);
    });
  }
}