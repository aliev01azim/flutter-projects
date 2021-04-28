import 'package:flutter/material.dart';
import 'package:login_stf/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validation {
  final globalkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      child: Column(
        children: [
          emailfield(),
          passwordfield(),
          Container(
            margin: EdgeInsets.only(bottom: 25),
          ),
          submit(),
        ],
      ),
    );
  }

  Widget emailfield() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        email = value;
      },
      validator: validateEmail,
      decoration: InputDecoration(
        hintText: 'azim@gmail.com',
        labelText: 'Your Email',
      ),
    );
  }

  Widget passwordfield() {
    return TextFormField(
      obscureText: true,
      onSaved: (String value) {
        password = value;
      },
      validator: validatePassword,
      decoration: InputDecoration(
        hintText: 'password',
        labelText: 'Your Password',
      ),
    );
  }

  Widget submit() {
    return RaisedButton(
      child: Text('Submit!'),
      onPressed: () {
        if (globalkey.currentState.validate()) {
          globalkey.currentState.save();
          globalkey.currentState.reset();
          print('email = $email, password = $password');
        }
      },
    );
  }
}
