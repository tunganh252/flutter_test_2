import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:flutter_test_2/widgets/new_transaction.widget.dart';
import 'package:flutter_test_2/widgets/transaction_list.widget.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(amount: 58.4, date: DateTime.now(), id: "a1", title: "Adiddas"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTrans = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
