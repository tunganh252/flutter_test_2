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
    Transaction(amount: 100, date: DateTime.now(), id: "a1", title: "Adiddas "),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(value.title),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(value.amount.toString()),
                          Text(value.date.toString()),
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
