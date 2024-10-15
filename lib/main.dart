// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:statement/CreateNewStatementPage.dart';
import 'package:statement/Statement.dart';
import 'package:statement/StatementDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Statement Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatementsPage(), // Your homepage for the list of statements
    );
  }
}

class StatementsPage extends StatelessWidget {
  List<Statement> statements = [
    Statement(
      title: 'June Statement',
      description: 'Statement for June expenses and income',
      startDate: DateTime(2024, 6, 1),
      balance: 2000,
      entries: [
        Entry(
          isIncome: true,
          description: 'Salary',
          date: DateTime(2024, 6, 5),
          amount: 3000,
          runningBalance: 3000,
        ),
        Entry(
          isIncome: false,
          description: 'Groceries',
          date: DateTime(2024, 6, 10),
          amount: 500,
          runningBalance: 2500,
        ),
        Entry(
          isIncome: false,
          description: 'Rent',
          date: DateTime(2024, 6, 15),
          amount: 1000,
          runningBalance: 1500,
        ),
      ],
    ),
    Statement(
      title: 'July Statement',
      description: 'Statement for July expenses and income',
      startDate: DateTime(2024, 7, 1),
      balance: 1500,
      entries: [
        Entry(
          isIncome: true,
          description: 'Freelance Project',
          date: DateTime(2024, 7, 2),
          amount: 1000,
          runningBalance: 1000,
        ),
        Entry(
          isIncome: false,
          description: 'Utilities',
          date: DateTime(2024, 7, 8),
          amount: 200,
          runningBalance: 800,
        ),
      ],
    ),
  ];

  StatementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Statements'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: statements.length,
              itemBuilder: (context, index) {
                final statement = statements[index];
                return ListTile(
                  title: Text(statement.title),
                  subtitle: Text('Balance: \₹${statement.currentBalance}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Implement delete functionality
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StatementDetailPage(statement: statement),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Create New Statement'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateNewStatementPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
