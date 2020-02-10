import 'package:Project_App/Pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username, _password;
  int flag;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In')
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Please type Username';
                }
              },
              onSaved: (input) => _username = input,
              decoration: InputDecoration(
                labelText: 'Username'
              ),
            ),
            TextFormField(
              validator: (input) {
                if(input.length < 6){
                  return 'Password must be of 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Sign In'),
            )
          ]
        )
      )
    );
  }

  void signIn(){
    final formState = _formkey.currentState;
    if(formState.validate()){
      if(_username=='Username') {
        flag=flag+1;
      }
      if(_password=='Password') {
        flag=flag+1;
      }
    }

  }
}