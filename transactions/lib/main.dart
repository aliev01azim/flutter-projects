// import 'package:flutter/material.dart';

// import './widgets/new_transaction.dart';
// import './widgets/transaction_list.dart';
// import './widgets/chart.dart';
// import './models/transaction.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Personal Expenses',
//       theme: ThemeData(
//           primarySwatch: Colors.purple,
//           accentColor: Colors.amber,
//           fontFamily: 'Quicksand',
//           textTheme: ThemeData.light().textTheme.copyWith(
//                 headline6: TextStyle(
//                   fontFamily: 'OpenSans',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//                 button: TextStyle(color: Colors.white),
//               ),
//           appBarTheme: AppBarTheme(
//             textTheme: ThemeData.light().textTheme.copyWith(
//                   headline6: TextStyle(
//                     fontFamily: 'OpenSans',
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//           )),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   // String titleInput;
//   // String amountInput;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Transaction> _userTransactions = [];

//   List<Transaction> get _recentTransactions {
//     return _userTransactions.where((tx) {
//       return tx.date.isAfter(
//         DateTime.now().subtract(
//           Duration(days: 7),
//         ),
//       );
//     }).toList();
//   }

//   void _addNewTransaction(
//       String txTitle, double txAmount, DateTime chosenDate) {
//     final newTx = Transaction(
//       title: txTitle,
//       amount: txAmount,
//       date: chosenDate,
//       id: DateTime.now().toString(),
//     );

//     setState(() {
//       _userTransactions.add(newTx);
//     });
//   }

//   void _startAddNewTransaction(BuildContext ctx) {
//     showModalBottomSheet(
//       context: ctx,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {},
//           child: NewTransaction(_addNewTransaction),
//           behavior: HitTestBehavior.opaque,
//         );
//       },
//     );
//   }

//   void _deleteTransaction(String id) {
//     setState(() {
//       _userTransactions.removeWhere((tx) => tx.id == id);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Personal Expenses',
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () => _startAddNewTransaction(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Chart(_recentTransactions),
//             TransactionList(_userTransactions, _deleteTransaction),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => _startAddNewTransaction(context),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:quiz/models/transaction.dart';
import 'package:quiz/widgets/new_transaction.dart';
import 'package:quiz/widgets/transaction_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transaction> list = [];

  void _func(String title, double amount, String id) {
    final tx = Transaction(
        title: title, amount: amount, id: DateTime.now().toString());
    setState(() {
      list.add(tx);
    });
  }

  void _onClick(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext context) => GestureDetector(
        onTap: () {},
        child: NewTx(_func),
        behavior: HitTestBehavior.opaque,
      ),
    );
  }

  void _deleteTx(String id) {
    list.removeWhere((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
      ),
      body: list.length <= 0
          ? Text('not tx yet')
          : TransactionList(list, _deleteTx),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClick(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
