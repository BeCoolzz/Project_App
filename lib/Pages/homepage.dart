import 'package:Project_App/model/todo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  List<TodoModel> tasks = [];

  TodoModel currentTask;

  @override
  Widget build(BuildContext context) {
    final TodoHelper _todoHelper = TodoHelper();
    return Scaffold(
      appBar: AppBar(title: Text("TODO")),
      body: Container(
        padding:EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
            ),
            FlatButton(
              child: Text("Insert"),
              onPressed: (){
                currentTask = TodoModel(name: textController.text);
                _todoHelper.insertTask(currentTask);
              },
              color: Colors.blue,
              textColor: Colors.white,
            ),
            FlatButton(
              child: Text("Show All Task"),
              onPressed: () async{
                List<TodoModel> list = await _todoHelper.getAllTask();

                setState(() {
                  tasks = list;
                });
              },
              color: Colors.red,
              textColor: Colors.white,
            ),

            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Text("${tasks[index].id}"),
                      title: Text("${tasks[index].name}"),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tasks.length,

              ),
            )
          ],
        ),
      ),
    );
  }
}