import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No transactions added",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 250,
                  child: Image.asset('assets/images/eror404.jpg',
                      fit: BoxFit.cover))
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (data, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTransaction(transactions[index].id),
                  ),
                ),
              );
            },
          );
  }
}

// Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).primaryColor,
//                                 // color: Colors.purple,
//                                 width: 2)),
//                         padding: EdgeInsets.all(10),
//                         child: Text(
//                           '\$${transactions[index].amount.toStringAsFixed(2)}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       ),
//                       Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(transactions[index].title,
//                               style:
//                                   // TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
//                                   Theme.of(context).textTheme.headline6),
//                           Text(
//                             DateFormat.yMMMMEEEEd()
//                                 .format(transactions[index].date),
//                             // DateFormat().format(value.date),
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
