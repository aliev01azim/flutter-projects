// import 'package:flutter/material.dart';
// import 'package:login_bloc/src/blocs/bloc.dart';
// import 'package:login_bloc/src/blocs/provider.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of(context);
//     return Column(
//       children: [
//         emailfield(bloc),
//         passwordfield(bloc),
//         Container(
//           margin: EdgeInsets.only(bottom: 20),
//         ),
//         button(bloc),
//       ],
//     );
//   }

//   Widget emailfield(Bloc bloc) {
//     return StreamBuilder(
//       stream: bloc.email,
//       builder: (context, snapshot) {
//         return TextField(
//           keyboardType: TextInputType.emailAddress,
//           onChanged: bloc.emailChange,
//           decoration: InputDecoration(
//             labelText: 'Email',
//             hintText: 'asda@',
//             errorText: snapshot.error,
//           ),
//         );
//       },
//     );
//   }

//   Widget passwordfield(Bloc bloc) {
//     return StreamBuilder(
//       stream: bloc.password,
//       builder: (context, snapshot) {
//         return TextField(
//           obscureText: true,
//           onChanged: bloc.passwordChange,
//           decoration: InputDecoration(
//             labelText: 'Password',
//             hintText: 'password',
//             errorText: snapshot.error,
//           ),
//         );
//       },
//     );
//   }

//   Widget button(Bloc bloc) {
//     return StreamBuilder(
//       stream: bloc.submit,
//       builder: (context, snapshot) {
//         return RaisedButton(
//           child: Text('Submit!'),
//           onPressed: snapshot.hasData ? bloc.submitButton : null,
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Column(
      children: [
        lf(bloc),
        pf(bloc),
        bf(bloc),
      ],
    );
  }

  Widget lf(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.emailChange,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: snapshot.error,
            hintText: 'email@',
          ),
        );
      },
    );
  }

  Widget pf(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordChange,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Passsword',
            errorText: snapshot.error,
            hintText: 'password',
          ),
        );
      },
    );
  }

  Widget bf(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.button,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit!'),
          onPressed: snapshot.hasData ? () {} : null,
        );
      },
    );
  }
}
