import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_zadanie/providers/auth.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  AuthScreen({
    Key key,
  }) : super(key: key);
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String phoneNo;
  String errorMessage = '';
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, bottom: 10, top: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Example +996999999999',
                    contentPadding: const EdgeInsets.only(left: 30)),
                onChanged: (value) {
                  phoneNo = value;
                },
              ),
            ),
            (errorMessage != ''
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                : Container()),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    Provider.of<Auth>(context, listen: false)
                        .verifyPhone(context, phoneNo);
                  },
                  child: Text(!isLogin ? 'Log in' : 'Sign up'),
                  textColor: Colors.white,
                  elevation: 7,
                  color: Colors.blue,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (isLogin) {
                          isLogin = false;
                        } else {
                          isLogin = true;
                        }
                      });
                    },
                    child: Text(
                        isLogin ? 'Уже есть аккаунт?' : 'Создать аккаунт?'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
