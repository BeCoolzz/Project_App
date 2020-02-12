import 'package:Project_App/Pages/Setup/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
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
              onPressed: signUp,
              child: Text('Sign Up'),
            )
          ]
        )
      )
    );
  }

Future<void>  signUp() async{
    //TO DO validate fields
    final formState = _formkey.currentState;
    if(formState.validate()){
      //TO DO login to firebase
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        user.user.sendEmailVerification();
        //Display for the user that we send an Email verification
        //
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
           
    }

  }
}