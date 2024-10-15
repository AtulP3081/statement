import 'package:flutter/material.dart';
import 'package:statement/Statement.dart';

class StatementDetailPage extends StatelessWidget {
  final Statement statement; // Assuming a Statement class
  StatementDetailPage({required this.statement});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(statement.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: statement.entries.length,
              itemBuilder: (context, index) {
                final entry = statement.entries[index];
                return ListTile(
                  leading: Text(entry.isIncome ? '+' : '-'),
                  title: Text(entry.description),
                  subtitle: Text('${entry.date}'),
                  trailing: Text(
                      '\₹${entry.amount} (Balance: \₹${entry.runningBalance})'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Add Income/Expense'),
              onPressed: () {
                // Navigate to add new income/expense page
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Total Incomes: \₹${statement.totalIncome}'),
                Text('Total Expenses: \₹${statement.totalExpenses}'),
                Text('Current Balance: \₹${statement.currentBalance}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
