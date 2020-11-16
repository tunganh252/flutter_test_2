import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_2/models/transaction.modal.dart';
import 'package:flutter_test_2/widgets/chart.widget.dart';
import 'package:flutter_test_2/widgets/new_transaction.widget.dart';
import 'package:flutter_test_2/widgets/transaction_list.widget.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Persional Expenses',
        theme: ThemeData(
            primarySwatch: Colors.brown,
            accentColor: Colors.deepOrange,
            fontFamily: 'Synemono',
            errorColor: Colors.red,
            textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  button: TextStyle(color: Colors.white)),
            )),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(amount: 58.4, date: DateTime.now(), id: "a1", title: "Adiddas"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
    Transaction(amount: 33.6, date: DateTime.now(), id: "a2", title: "Nike"),
  ];

  bool _showChart = false;

  //////////////////////////////////////////

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((elm) {
      return elm.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTrans = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: selectedDate.toString());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((elm) {
        return elm.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _isLanscape = _mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text(
              'Tung Anh nguyen',
              style:
                  TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              )
            ],
          );

    final txListWidget = Container(
        height: (_mediaQuery.size.height -
                appBar.preferredSize.height -
                _mediaQuery.padding.top) *
            0.6,
        child: TransactionList(_userTransactions, _deleteTransaction));
    final pageBody = SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(
          //   width: 200,
          //   height: _mediaQuery.size.height * 0.2,
          //   child: Card(
          //     color: Colors.blueGrey,
          //     elevation: 30,
          //     child: Container(
          //         padding: EdgeInsets.all(70),
          //         child: Text(
          //           "Submit Transaction",
          //         )),
          //   ),
          // ),
          if (_isLanscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Switch.adaptive(
                      activeColor: Theme.of(context).primaryColor,
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      }),
                )
              ],
            ),
          if (!_isLanscape)
            Container(
                height: (_mediaQuery.size.height -
                        appBar.preferredSize.height -
                        _mediaQuery.padding.top) *
                    0.3,
                child: Chart(_recentTransactions)),
          if (!_isLanscape) txListWidget,
          if (_isLanscape)
            _showChart
                ? Container(
                    height: (_mediaQuery.size.height -
                            appBar.preferredSize.height -
                            _mediaQuery.padding.top) *
                        0.7,
                    child: Chart(_recentTransactions))
                : txListWidget
        ],
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
