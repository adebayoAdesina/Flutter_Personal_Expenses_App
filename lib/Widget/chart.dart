import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/Model/transaction_model.dart';
import 'package:personal_expenses/Widget/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date!.day == weekDay.day &&
            recentTransactions[i].date!.month == weekDay.month &&
            recentTransactions[i].date!.year == weekDay.year) {
          totalSum += recentTransactions[i].amount!;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupedTransaction.fold(0.0,
        (previousValue, element) => previousValue + (element['amount'] as num));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransaction
                .map((e) => ChartBar(
                      label: e['day'].toString(),
                      spendAmount: e['amount'] as double,
                      spentTotal: totalSpending == 0
                          ? 0
                          : (e['amount'] as double) / totalSpending,
                    ))
                .toList()),
      ),
    );
  }
}
