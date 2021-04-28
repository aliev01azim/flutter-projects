// import 'package:flutter/material.dart';
// import 'src/app.dart';

// void main() {
//   runApp(App());
// }

// // main

// import 'package:flutter/material.dart';
// import 'screens/login_screen.dart';

// class App extends StatelessWidget {
//   Widget build(context) {
//     return MaterialApp(
//       title: 'Log Me In!',
//       home: Scaffold(
//         body: LoginScreen(),
//       ),
//     );
//   }
// }

// // app.dart
// import 'package:flutter/material.dart';
// import '../mixins/validation_mixin.dart';

// class LoginScreen extends StatefulWidget {
//   createState() {
//     return LoginScreenState();
//   }
// }

// class LoginScreenState extends State<LoginScreen> with ValidationMixin {
//   final formKey = GlobalKey<FormState>();

//   String email = '';
//   String password = '';

//   Widget build(context) {
//     return Container(
//       margin: EdgeInsets.all(20.0),
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             emailField(),
//             passwordField(),
//             Container(margin: EdgeInsets.only(top: 25.0)),
//             submitButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget emailField() {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         labelText: 'Email Address',
//         hintText: 'you@example.com',
//       ),
//       validator: validateEmail,
//       onSaved: (String value) {
//         email = value;
//       },
//     );
//   }

//   Widget passwordField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         labelText: 'Password',
//         hintText: 'Password',
//       ),
//       obscureText: true,
//       validator: validatePassword,
//       onSaved: (String value) {
//         password = value;
//       },
//     );
//   }

//   Widget submitButton() {
//     return RaisedButton(
//       color: Colors.blue,
//       child: Text('Submit!'),
//       onPressed: () {
//         if (formKey.currentState.validate()) {
//           formKey.currentState.save();
//           formKey.currentState.reset();
//           print(
//               'Time to post my email $email and my password $password to my API');
//         }
//       },
//     );
//   }
// }

// // login_screen.dart
// class ValidationMixin {
//   String validateEmail(String value) {
//     if (!value.contains('@')) {
//       return 'Please enter a valid email';
//     }

//     return null;
//   }

//   String validatePassword(String value) {
//     if (value.length < 4) {
//       return 'Password must be at least 4 characters';
//     }

//     return null;
//   }
// }
// // validate_mixin.dart
