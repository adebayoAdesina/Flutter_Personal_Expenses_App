import 'dart:collection';

import 'package:flutter/material.dart';

import '../Model/transaction_model.dart';

class AppData extends ChangeNotifier {
  final List<Transaction> _transaction = [];

  void upDateTransaction(String title, double amount, DateTime date) {
    _transaction.add(
      Transaction(
        id: _transaction.length,
        title: title,
        amount: amount,
        date: date,
      ),
    );
    notifyListeners();
  }

  List<Transaction> get recentTransactions {
    return _transaction.where((element) {
      return element.date!
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void deleteTransaction(Transaction transactionModel) {
    _transaction.removeWhere((element) => element == transactionModel);
    notifyListeners();
  }

  UnmodifiableListView<Transaction> get transaction =>
      UnmodifiableListView(_transaction);
}
