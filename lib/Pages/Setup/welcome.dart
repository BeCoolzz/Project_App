import 'package:Project_App/Pages/Setup/sign_up.dart';
import 'package:Project_App/Pages/Setup/signin.dart';
import 'package:flutter/material.dart';

class welcomePage extends StatefulWidget {
  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to the App')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
        RaisedButton(
              onPressed: navigateToSignIn,
              child: Text('Sign In'),
        ),
        
        RaisedButton(
              onPressed: navigateToSignUp,
              child: Text('Sign Up'),
        )
        ]
      ),
    );
  }
  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }
  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => signUp()));
  }
}