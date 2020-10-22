import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTrans);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount.isNaN || enteredAmount <= 0) {
      return;
    }

    addNewTrans(enteredTitle, enteredAmount);
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
