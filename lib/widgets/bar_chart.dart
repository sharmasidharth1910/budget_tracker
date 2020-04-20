import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart({
    this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((expense) {
      if (expense > mostExpensive) {
        mostExpensive = expense;
      }
    });

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            "Monthly Spending",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
                iconSize: 25.0,
              ),
              Text(
                "April 19, 2020 - May 19, 2020",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {},
                iconSize: 25.0,
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Bar(
                label: "Sun",
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Mon",
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Tue",
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Wed",
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Thu",
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Fri",
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: "Sat",
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;

  Bar({
    this.label,
    this.amountSpent,
    this.mostExpensive,
  });

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;

    return Column(
      children: <Widget>[
        Text(
          "\$${amountSpent.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
