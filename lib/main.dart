import 'package:flutter/material.dart';
import 'package:flutter_test_2/transactions.modal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 58.4, date: DateTime.now(), id: "a1", title: "Adiddas "),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is my app"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              child: Card(
                color: Colors.red,
                elevation: 30,
                child: Text("sdfsf"),
              ),
            ),
            Column(
              children: transactions.map((value) {
                return Card(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.redAccent, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${value.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 21),
                          ),
                          Text(
                            value.date.toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ));
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("This is my app"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             child: Card(
//               color: Colors.blue,
//               child: Text("CHART"),
//               elevation: 10,
//             ),
//           ),
//           Card(
//             child: Text("List of text"),
//           ),
//         ],
//       ),
//     );
//   }
// }
