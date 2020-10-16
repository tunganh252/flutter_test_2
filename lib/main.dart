import 'package:flutter/material.dart';

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
        body: Row(
          children: [
            Container(
              width: 200,
              child: Card(
                color: Colors.red,
                elevation: 30,
                child: Text("sdfsf"),
              ),
            ),
            Card(
              child: Text("llll"),
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
