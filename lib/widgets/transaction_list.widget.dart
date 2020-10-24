import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (data, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor,
                          // color: Colors.purple,
                          width: 2)),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(transactions[index].date),
                      // DateFormat().format(value.date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
