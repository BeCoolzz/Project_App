import 'package:Project_App/Pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  
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
                  return 'Please type Email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                labelText: 'Email'
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
              onPressed: signIn,
              child: Text('Sign In'),
            )
          ]
        )
      )
    );
  }

Future<void>  signIn() async{
    //TO DO validate fields
    final formState = _formkey.currentState;
    if(formState.validate()){
      //TO DO login to firebase
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        //TO DO Navigate to home
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(/*user: user*/)));
      } catch (e) {
        print(e.message);
      }
           
    }

  }
}