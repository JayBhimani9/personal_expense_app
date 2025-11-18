import 'package:flutter/material.dart';
import 'package:flutter_personal_money_app/widgets/chart_bar.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class Chart extends StatelessWidget {
  final List<Transactions> userTransactions;
  Chart(this.userTransactions);

  List<Map<String, Object>> get generateTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (var tx in userTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return generateTransactions.fold<double>(
      0.0,
      (previousValue, tx) =>
          previousValue + ((tx['amount'] as num?)?.toDouble() ?? 0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: generateTransactions.map((data) {
              final label = (data['day'] as String?) ?? '';
              final spending = (data['amount'] as num?)?.toDouble() ?? 0.0;

              return Flexible(
                fit: FlexFit.loose,
                child: ChartBar(
                  label,
                  spending,
                  totalSpending == 0.0 ? 0.0 : spending / totalSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
