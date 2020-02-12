import 'package:Project_App/Pages/Setup/welcome.dart';
import 'package:flutter/material.dart';

void main() => runApp(Project_App());

class Project_App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Project_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: welcomePage(),
    );
  }
}