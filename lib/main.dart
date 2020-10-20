import 'package:flutter/material.dart';
import 'package:flutter_test_2/widgets/user_transactions.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter App', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is my app"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              child: Card(
                color: Colors.blueGrey,
                elevation: 30,
                child: Container(
                    padding: EdgeInsets.all(90),
                    child: Text(
                      "Submit Transaction",
                    )),
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
