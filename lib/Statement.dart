class Statement {
  String title;
  String description;
  DateTime startDate;
  double balance;
  List<Entry> entries;

  Statement({
    required this.title,
    required this.description,
    required this.startDate,
    required this.balance,
    required this.entries,
  });

  double get totalIncome => entries
      .where((entry) => entry.isIncome)
      .fold(0.0, (prev, entry) => prev + entry.amount);

  double get totalExpenses => entries
      .where((entry) => !entry.isIncome)
      .fold(0.0, (prev, entry) => prev + entry.amount);

  double get currentBalance => totalIncome - totalExpenses;
}

class Entry {
  bool isIncome; // true for income, false for expense
  String description;
  DateTime date;
  double amount;
  double runningBalance;

  Entry({
    required this.isIncome,
    required this.description,
    required this.date,
    required this.amount,
    required this.runningBalance,
  });
}

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
