import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:flutter_test_2/widgets/chart.widget.dart';
import 'package:flutter_test_2/widgets/new_transaction.widget.dart';
import 'package:flutter_test_2/widgets/transaction_list.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Persional Expenses',
        theme: ThemeData(
            primarySwatch: Colors.brown,
            accentColor: Colors.deepOrange,
            fontFamily: 'Synemono',
            errorColor: Colors.red,
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  button: TextStyle(color: Colors.white)),
            )),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(amount: 58.4, date: DateTime.now(), id: "a1", title: "Adiddas"),
    // Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    // Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    // Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((elm) {
      return elm.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTrans = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: selectedDate.toString());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((elm) {
        return elm.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Tung Anh nguyen',
        style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                color: Colors.blueGrey,
                elevation: 30,
                child: Container(
                    padding: EdgeInsets.all(70),
                    child: Text(
                      "Submit Transaction",
                    )),
              ),
            ),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: Chart(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.6,
                child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
