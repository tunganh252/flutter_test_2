import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${spendingAmount.toStringAsFixed(0)}'),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
