import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTrans;

  NewTransaction(this.addNewTrans);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : 0;

    if (enteredTitle.isEmpty || enteredAmount.isNaN || enteredAmount <= 0) {
      return;
    }

    widget.addNewTrans(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              textColor: Colors.grey,
              onPressed: () => submitData(),
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            )
          ],
        ),
      ),
    );
  }
}
