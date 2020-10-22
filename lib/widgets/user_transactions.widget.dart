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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
      ],
    );
  }
}
