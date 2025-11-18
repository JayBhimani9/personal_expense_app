import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> userTransactions;
  final Function deleteTransaction;
  TransactionList({required this.userTransactions, required this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions Added Yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (ctx, index) => Card(
              key: ValueKey(userTransactions[index].id),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('\$${userTransactions[index].amount.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
                title: Text(
                  userTransactions[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(DateFormat.yMMMd().format(userTransactions[index].date)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteTransaction(userTransactions[index].id),
                ),
              ),
            ),
          );
  }
}
