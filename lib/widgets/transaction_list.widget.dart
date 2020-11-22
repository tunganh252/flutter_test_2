import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:flutter_test_2/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  "No transactions added",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constrains.maxHeight * 0.7,
                    child: Image.asset('assets/images/eror404.jpg',
                        fit: BoxFit.cover))
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (data, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}
