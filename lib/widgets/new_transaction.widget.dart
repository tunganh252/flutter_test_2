import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNewTrans;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addNewTrans);

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
              // onChanged: (value) => inputTitle = value,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => inputAmount = value,
              controller: amountController,
            ),
            FlatButton(
              textColor: Colors.grey,
              onPressed: () => addNewTrans(
                  titleController.text, double.parse(amountController.text)),
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
